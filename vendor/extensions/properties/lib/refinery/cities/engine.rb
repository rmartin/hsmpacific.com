module Refinery
  module Properties
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Properties

      engine_name :refinery_properties

      initializer "register refinerycms_cities plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "cities"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.properties_admin_cities_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/properties/city',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/properties/cities(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Cities)
      end
    end
  end
end
