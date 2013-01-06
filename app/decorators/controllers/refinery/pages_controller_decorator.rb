Refinery::PagesController.class_eval do

    before_filter :find_all_brokers, :only => [:show]
    before_filter :find_all_tenants, :only => [:show]
  
    protected
    
      def find_all_brokers
        @brokers = Refinery::Brokers::Broker.all
      end
      
      def find_all_tenants
        @tenants = Refinery::Tenants::Tenant.all
      end

  end