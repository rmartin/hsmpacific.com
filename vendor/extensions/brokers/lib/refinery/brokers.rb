require 'refinerycms-core'

module Refinery
  autoload :BrokersGenerator, 'generators/refinery/brokers_generator'

  module Brokers
    require 'refinery/brokers/engine'

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
