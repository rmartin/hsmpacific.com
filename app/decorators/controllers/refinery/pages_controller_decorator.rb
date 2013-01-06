Refinery::PagesController.class_eval do

    before_filter :find_all_brokers
  
    protected
    
      def find_all_brokers
        @brokers = Refinery::Brokers::Broker.all
      end

  end