module Refinery
  module Properties
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Properties

      engine_name :refinery_properties

      initializer "register refinerycms_area_codes plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "area_codes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.properties_admin_area_codes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/properties/area_code',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/properties/area_codes(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::AreaCodes)
      end
    end
  end
end
