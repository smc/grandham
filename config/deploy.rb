require "rvm/capistrano"
require 'bundler/capistrano'

set :rvm_ruby_string, 'ruby-1.9.3-p392@grandham1'
set :rvm_type, :user

set :application, "grandham"
set :repository,  "git@github.com:smc/grandham.git"

role :web, "dev.grandham.org"
role :app, "dev.grandham.org"
role :db,  "dev.grandham.org", :primary => true

set :branch, 'bootstrap_3'

set :user, 'deployer'
set :use_sudo, false

set :deploy_to, "/var/rails_apps/staging/#{application}"

set :rails_env, 'production'

set :scm, :git
set :deploy_via, 'remote_cache'
set :ssh_options, { :forward_agent =>  true }
set :copy_exclude, ".git/*"
set :copy_cache, true

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :stop do ; end

  task :db_migrate, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && bundle exec rake db:migrate RAILS_ENV=#{rails_env}"
  end

  task :copy_env_specific_files, :roles => :app, :except => { :no_release => true } do
    run "cp #{shared_path}/.rvmrc #{current_path}/.rvmrc"
    run "cp #{shared_path}/database.yml #{current_path}/config/database.yml"
    run "cd #{current_path}/vendor && ln -s #{shared_path}/bundle/ ."
    run "cd #{current_path} && bundle install --quiet --without development test --path vendor/bundle"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after 'deploy:create_symlink', 'deploy:copy_env_specific_files'
after 'deploy:copy_env_specific_files', 'deploy:db_migrate'