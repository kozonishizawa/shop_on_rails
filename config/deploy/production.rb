lock '3.11.0'

require 'yaml'
require 'capistrano/sidekiq'

set :application, 'shop_on_rails'

# environment
set :rails_env, 'production'

#set :scm, :git
set :keep_releases, 3

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'tmp/storage', 'node_modules', 'vendor/bundle', 'public/sitemaps', 'public/packs'

# 指定ファイルに変化が生じた場合にprecompileを行う
set :assets_dependencies, %w(app/assets app/javascript package.json yarn.lock config/webpack)

# ruby
set :rbenv_ruby, '2.6.3'
set :default_env, { path: '~/.rbenv/shims:~/.rbenv/bin:$PATH' }

set :repo_url, 'git@github.com:kenzooooo/shop_on_rails.git'
set :branch, 'master'
set :deploy_to, '/home/media'
set :log_level, :debug
set :default_shell, '/bin/bash -l'

server 'aws', user: 'media', roles: %w{app assets batch db}

set :assets_roles, [:assets]


# sidekiq
set :sidekiq_role, :batch

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do

  task :restart do
    invoke 'unicorn:legacy_restart'
  end

  # migration前にdatabaseを作成する
  before :migrate, :db_create do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          info 'creating database...'
          execute :rails, 'db:create'
        end
      end
    end
  end
end