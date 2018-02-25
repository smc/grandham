# config valid only for current version of Capistrano
lock '3.4.0'

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.3.0'

#TODO: Check the application name
set :application, 'grandham'

#TODO: Replace with valid github url
set :repo_url, 'git@github.com:smc/grandham.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/data/apps/#{fetch(:application)}"

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', '.rbenv-vars')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'config/settings',
                                               'vendor/bundle', 'public/system', 'db/backups', 'uploads')


set :keep_releases, 5

#Default value to keep db dumps for 5 days 
set :db_dump_retention, 5

set :bundle_without, %w{development test utils}.join(' ')

set :git_tag_name, proc { Time.now.to_s.gsub(/[-\s\:\+]+/, '-') }

set :bundle_jobs, 4

before 'deploy:migrate', 'db:backup'
after 'deploy:finishing', 'deploy:cleanup'
after 'deploy:cleanup', 'unicorn:restart'
after 'deploy:cleanup', 'delayed_job:restart'
