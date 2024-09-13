require 'rails'

module RspackRails
  class Railtie < ::Rails::Railtie
    rake_tasks do
        Dir[File.join(__dir__, '../tasks/**/*.rake')].each do |f|
            puts "Loading Rake task from #{f}" # Debugging output
            load f
          end
      # Load all .rake files from the tasks directory
    #   Dir[File.join(__dir__, '../tasks/**/*.rake')].each { |f| load f }
      
      # Enhance the assets:precompile task
      Rake::Task['assets:precompile'].enhance(['rspack:compile'])
    end

    # Include your helper methods into ActionView
    initializer 'rspack_rails.helpers' do
      ActiveSupport.on_load(:action_view) do
        include RspackRails::Helper
      end
    end
  end
end