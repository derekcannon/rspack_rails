# frozen_string_literal: true

require 'rspack_rails/helper'

module RspackRails
  class Engine < ::Rails::Engine
    initializer 'rspack_rails.helper' do
      ActiveSupport.on_load(:action_view) do
        include RspackRails::Helper
      end
    end

    rake_tasks do
      # Enhance the assets:precompile task
      Rake::Task['assets:precompile'].enhance(['rspack:compile'])
    end
  end
end
