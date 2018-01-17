# config valid only for current version of Capistrano
lock "3.9.0"

set :application, "billybo"
set :repo_url,    "deploy@185.26.98.204:/var/repos/store_app.git"
set :branch, "master"
set :keep_releases, 3
set :scm, :git
set :use_sudo, false
set :deploy_to,   "/var/www/#{application}/production"
set :branch, "master"

set :rvm_type, :system
set :rvm_ruby_version, '2.4.0p0'      # Defaults to: 'default'

set :rails_env, "production"

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs,  "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/upload"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  namespace :custom_symlinks do
    task :custom_configs do
      run "ln -nsf #{shared_path}/config/database.yml #{current_release}/config/"
    end

    task :user_files do
      run "ln -nsf #{shared_path}/public/uploads/ #{current_release}/public/"
    end

    task :default do
      custom_configs
      user_files
    end
  end

  task :start do ; end
  task :stop do ; end

  task  :restart,
        :roles => :app,
        :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :migrate do
  task :default do
    run "cd #{current_release} bundle exec rake db:migrate"
  end
end

before "deploy:assets:precompile", "deploy:custom_symlinks"
after "deploy:update", "deploy:cleanup"