module Refinery
  module Tenants
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Tenants

      engine_name :refinery_tenants

      initializer "register refinerycms_tenants plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "tenants"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.tenants_admin_tenants_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/tenants/tenant',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Tenants)
      end
    end
  end
end
