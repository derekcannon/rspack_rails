require 'rspack_rails/manifest'

module RspackRails
  module Helper
    def javascript_pack_tag(name, **options)
      path = RspackRails::Manifest.lookup("#{name}.js")
      javascript_include_tag(path, **options)
    end

    def stylesheet_pack_tag(name, **options)
      path = RspackRails::Manifest.lookup("#{name}.css")
      stylesheet_link_tag(path, **options)
    end
  end
end
