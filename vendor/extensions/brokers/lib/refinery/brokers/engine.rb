module Refinery
  module Brokers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Brokers

      engine_name :refinery_brokers

      initializer "register refinerycms_brokers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "brokers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.brokers_admin_brokers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/brokers/broker',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Brokers)
      end
    end
  end
end
