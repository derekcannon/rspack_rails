namespace :rspack do
    desc "Compile assets with Rspack"
    task compile: :environment do
      sh "yarn rspack --config rspack.config.js"
    end

    desc "Start Rspack in watch mode"
    task 'watch' => :environment do
      sh "yarn rspack --watch --config rspack.config.js"
    end

    desc "Start Rspack dev server"
        task 'dev_server' => :environment do
        sh "yarn rspack serve --config rspack.config.js"
    end
end