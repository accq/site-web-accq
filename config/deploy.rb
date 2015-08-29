# config valid only for Capistrano 3.1
lock '3.4.0'

set :application, 'accq'
set :repo_url, 'git@bitbucket.org:flamontagne/accq.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

 set :deploy_to, '/home/frank/apps/accq'
 set :scm, :git

 set :format, :pretty
 set :log_level, :debug
 set :pty, true

 set :linked_files, %w{config/database.yml .rbenv-vars .ruby-version}
 set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

 set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" } 
 set :keep_releases, 5
set :bundle_binstubs, nil 
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.1'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do      
      execute "ln -nfs #{deploy_to}/shared/uploads/ #{release_path}/public/uploads"
    end
  end
  after :finishing, 'deploy:cleanup'  
end
after 'deploy:publishing', 'deploy:restart'