# frozen_string_literal: true

require 'rspack_rails/manifest'
require 'rspack_rails/configuration'

module RspackRails
  module Helper
    def javascript_pack_tag(name, **options)
      path = asset_path("#{name}.js")
      javascript_include_tag(path, **options)
    end

    def stylesheet_pack_tag(name, **options)
      # TODO: do we want to use a different variable for skipping stylesheets? like USE_HMR?
      return '' if dev_server? # HMR does not currently work with extracted CSS

      path = asset_path("#{name}.css")
      stylesheet_link_tag(path, **options)
    end

    private

    def asset_path(name)
      if configuration.use_dev_server
        "#{configuration.dev_server_url}/#{name}"
      else
        RspackRails::Manifest.lookup(name)
      end
    end

    def configuration
      @configuration ||=
        if Rails.application.config.respond_to?(:rspack)
          Rails.application.config.rspack
        else
          RspackRails::Configuration.new
        end
    end

    def dev_server?
      configuration.use_dev_server
    end
  end
end
