module RspackRails
    class Engine < ::Rails::Engine
      initializer 'rspack_rails.helper' do
        ActiveSupport.on_load(:action_view) do
          include RspackRails::Helper
        end
      end
    end
end