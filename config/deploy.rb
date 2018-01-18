# config valid only for current version of Capistrano
lock "3.10.1"

set :application, "billybo"
set :repo_url,    "deploy@185.26.98.204:/var/repos/store_app.git"
set :branch, "master"
set :keep_releases, 3
set :use_sudo, false
set :deploy_to,   "/var/www/billybo/production"
set :branch, "master"

set :rvm_type, :system
set :rvm_ruby_version, '2.4'      # Defaults to: 'default'

set :rails_env, "production"
set :stage, :production
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs,  "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/upload"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  # desc "Make sure local git is in sync with remote."
  # task :check_revision do
  #   on roles(:app) do
  #     unless `git rev-parse HEAD` == `git rev-parse origin/master`
  #       puts "WARNING: HEAD is not the same as origin/master"
  #       puts "Run `git push` to sync changes."
  #       exit
  #     end
  #   end
  # end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  # before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end