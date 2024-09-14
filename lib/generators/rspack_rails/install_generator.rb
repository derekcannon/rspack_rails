# frozen_string_literal: true

module RspackRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def create_rspack_config
        copy_file 'rspack.config.js', 'rspack.config.js'
      end

      def create_entry_points
        empty_directory 'app/javascript/packs'
        create_file 'app/javascript/packs/application.js', '// Entry point for the application'
      end

      def add_package_json_dependencies
        run 'yarn add @rspack/cli @rspack/core rspack-manifest-plugin clean-webpack-plugin --dev'
      end
    end
  end
end
