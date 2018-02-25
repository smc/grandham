# Sample verbose configuration file for Unicorn (not Rack)
#
# This configuration file documents many features of Unicorn
# that may not be needed for some applications. See
# http://unicorn.bogomips.org/examples/unicorn.conf.minimal.rb
# for a much simpler configuration file.
#
# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.

# Tweak it as per the need of the application
worker_processes 1

# Since Unicorn is never exposed to outside clients, it does not need to
# run on the standard HTTP port (80), there is no reason to start Unicorn
# as root unless it's from system init scripts.
# If running the master process as root and the workers as an unprivileged
# user, do this to switch euid/egid in the workers (also chowns logs):
# user "unprivileged_user", "unprivileged_group"

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
working_directory "/data/apps/grandham/current" # available in 0.94.0+

# listen on both a Unix domain socket and a TCP port,
# we use a shorter backlog for quicker failover when busy
listen "/data/apps/grandham/shared/tmp/sockets/unicorn.sock", :backlog => 64
# listen 8080, :tcp_nopush => true

# After the timeout is exhausted, the unicorn worker will be killed and a new
# one brought up in its place. Adjust this to your application's needs. The
# default timeout is 60 seconds.
#
# When a user is on a slow internet and is attempting to upload a large file then
# it will take sometime for the file to be uploaded. Hence setting it to 120 seconds.
# Ideally files should directly be uploaded to S3 or some other similar service.
timeout 40


pid "/data/apps/grandham/shared/tmp/pids/unicorn.pid"

# By default, the Unicorn logger will write to stderr.
# Additionally, other applications/frameworks log to stderr or stdout,
# so prevent them from going to /dev/null when daemonized here:
stderr_path "/data/apps/grandham/shared/log/unicorn.stderr.log"
stdout_path "/data/apps/grandham/shared/log/unicorn.stdout.log"

# http://rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
# http://stackoverflow.com/questions/18124417/how-do-i-tell-if-ruby-2-0-is-copy-on-write-friendly
preload_app true

if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

# Enable this flag to have unicorn test client connections by writing the
# beginning of the HTTP headers before calling the application.  This
# prevents calling the application for connections that have disconnected
# while queued.  This is only guaranteed to detect clients on the same
# host unicorn runs on, and unlikely to detect disconnects even on a
# fast LAN.
check_client_connection false

before_fork do |server, worker|
    # the following is highly recomended for Rails + "preload_app true"
    # as there's no need for the master process to hold a connection

    defined?(ActiveRecord::Base) and
            ActiveRecord::Base.connection.disconnect!

    # When sent a USR2, Unicorn will suffix its pidfile with .oldbin and
    # immediately start loading up a new version of itself (loaded with a new
    # version of app). When this new Unicorn is completely loaded
    # it will begin spawning workers. The first worker spawned will check to
    # see if an .oldbin pidfile exists. If so, this means we've just booted up
    # a new Unicorn and need to tell the old one that it can now die. To do so
    # we send the old version a QUIT or TTOU. QUIT is a signal to gracefully quit.
    # TTOU is a signal to decrement the number of workers.
    #
    # Let's say that number of workers set is 5. So the old master has 5 workers
    # running. And then we deploy the code. Now the first worker of the new
    # master comes along. If we QUIT old master then all the 5 old workers will
    # also quit at the same time. So we check if the worker number ( which is 1 )
    # in this case is leass than 5 ( 1 >= 5 ). This is false so we send TTOU to the
    # old master to decrement its worker by 1. This will go on for 4 times and then
    # now we have 4 new workers and 1 old worker. Now condition ( 5 >= 5) is true
    # and now old master will be asked to QUIT. And that's the end of the process
    # of rebooting.
    #
    old_pid = "#{server.config[:pid]}.oldbin"
    if old_pid != server.pid
      begin
        sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU

        # Do not get fooled by kill. In *nix kill is a way to send signal. I know it's
        # a terrible name but it has a long history. Here are some examples.
        #
        # kill -USR1 31950
        # kill -QUIT 31950
        # kill -KILL 31950
        # kill -TTOU 31950
        #
        Process.kill(sig, File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
        # looks like old process is already dead. Hurray!
      end
    end
    #
    # Throttle the master from forking too quickly by sleeping.  Due
    # to the implementation of standard Unix signal handlers, this
    # helps (but does not completely) prevent identical, repeated signals
    # from being lost when the receiving process is busy.
    # sleep 1
end

after_fork do |server, worker|
    # per-process listener ports for debugging/admin/migrations
    # addr = "127.0.0.1:#{9293 + worker.nr}"
    # server.listen(addr, :tries => -1, :delay => 5, :tcp_nopush => true)

    # the following is *required* for Rails + "preload_app true",
    defined?(ActiveRecord::Base) and
            ActiveRecord::Base.establish_connection

    # if preload_app is true, then you may also want to check and
    # restart any other shared sockets/descriptors such as Memcached,
    # and Redis.  TokyoCabinet file handles are safe to reuse
    # between any number of forked children (assuming your kernel
    # correctly implements pread()/pwrite() system calls)
end
