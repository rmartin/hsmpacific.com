Refinery::PagesController.class_eval do

    before_filter :find_all_brokers, :only => [:show]
    before_filter :find_all_tenants, :only => [:show]
    before_filter :find_exclusive_tenants, :only => [:home]
    before_filter :find_all_properties
  
    protected
    
      def find_all_brokers
        @brokers = Refinery::Brokers::Broker.all
      end
      
      def find_all_tenants
        @tenants = Refinery::Tenants::Tenant.all
      end
      
      def find_exclusive_tenants
        @exclusiveTenants = Refinery::Tenants::Tenant.where(:is_exclusive_tenant => true)
      end
      
      def find_all_properties
        @properties = Refinery::Properties::Property.order("title ASC")
      end
      

  end