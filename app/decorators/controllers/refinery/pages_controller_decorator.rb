Refinery::PagesController.class_eval do

    before_filter :find_all_brokers, :only => [:show]
    before_filter :find_all_tenants, :only => [:show]
    before_filter :find_exclusive_tenants, :only => [:home]
    before_filter :find_all_properties, :onluy => [:"Avaiable Properties"]
  
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
        @cities = Refinery::Properties::City.order("name ASC")
        @areaCodes = Refinery::Properties::AreaCode.order("name ASC")
        @brokers = Refinery::Brokers::Broker.all
        
        #order params
        @propertyTypes = ['Sale', 'Lease']
        @stateCodes = ['Oregon', 'Washington']
        @sortBy = ['Title', 'City', 'Area', 'State']
        
        
        #filter parameters
        @filterParams = params[:filter]
        
        @properties = Refinery::Properties::Property.order("title ASC");
       
        if @filterParams != nil
          
          if @filterParams['city_id'] != nil and @filterParams['city_id'] != '' 
            @properties = @properties.where("city_id = ?", @filterParams['city_id'])
          end
          
          if @filterParams['area_code_id'] != nil and @filterParams['area_code_id'] != '' 
            @properties = @properties.where("area_code_id = ?", @filterParams['area_code_id'])
          end
          
          if @filterParams['property_broker_id'] != nil and @filterParams['property_broker_id'] != ''
            @properties = @properties.joins(:brokers)
            @properties = @properties.where("broker_id = ?", @filterParams['property_broker_id'])
          end
          
        end
        
        
      end
      

  end