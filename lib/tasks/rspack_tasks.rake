# frozen_string_literal: true

namespace :rspack do
  desc 'Compile assets with Rspack'
  task 'compile' do
    node_env = ENV['NODE_ENV'] || 'production'
    sh "NODE_ENV=#{node_env} yarn rspack --config rspack.config.js"
  end

  desc 'Start Rspack in watch mode'
  task 'watch' do
    node_env = ENV['NODE_ENV'] || 'development'
    sh "NODE_ENV=#{node_env} yarn rspack --watch --config rspack.config.js"
  end

  desc 'Start Rspack dev server'
  task 'dev_server' do
    node_env = ENV['NODE_ENV'] || 'development'
    sh "NODE_ENV=#{node_env} USE_DEV_SERVER=true yarn rspack serve --config rspack.config.js"
  end
end
