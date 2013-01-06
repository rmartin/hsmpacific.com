require 'refinerycms-core'

module Refinery
  autoload :TenantsGenerator, 'generators/refinery/tenants_generator'

  module Tenants
    require 'refinery/tenants/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
