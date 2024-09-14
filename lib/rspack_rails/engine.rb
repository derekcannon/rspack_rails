require "rspack_rails/helper"

module RspackRails
  class Engine < ::Rails::Engine
    initializer 'rspack_rails.helper' do
      ActiveSupport.on_load(:action_view) do
        include RspackRails::Helper
      end
    end

    rake_tasks do
      # Load all .rake files from the tasks directory
      Dir[File.join(__dir__, '../tasks/**/*.rake')].each { |f| load f }

      # Enhance the assets:precompile task
      Rake::Task['assets:precompile'].enhance(['rspack:compile'])
    end
  end
end
