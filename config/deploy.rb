# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'manuras-site'
set :repo_url, 'git@github.com:Manuras/manuras-site.git'
set :deploy_to, '/home/app/manuras-site'
set :pty, true

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', '.env')

set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :tmp_dir, '/home/app/tmp'

set :rbenv_ruby, '2.2.2'

namespace :deploy do
  task :restart do
    on roles(:app) do
      execute "touch #{File.join(current_path,'tmp','restart.txt')}"
    end
  end
end

after 'deploy:finishing', 'deploy:restart'