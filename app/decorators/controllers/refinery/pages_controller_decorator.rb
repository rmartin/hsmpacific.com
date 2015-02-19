Refinery::PagesController.class_eval do

    before_filter :find_all_brokers, :only => [:show]
    before_filter :find_all_tenants, :only => [:show]
    before_filter :find_exclusive_tenants, :only => [:home]
    before_filter :find_all_properties, :only => [:show]

    protected

      def find_all_brokers
        @brokersContact = Refinery::Brokers::Broker.order("position ASC");
      end

      def find_all_tenants
        @tenants = Refinery::Tenants::Tenant.order('name ASC')
      end

      def find_exclusive_tenants
        @exclusiveTenants = Refinery::Tenants::Tenant.where(:is_exclusive_tenant => true).order('name ASC')
      end

      def find_all_properties
        @cities = Refinery::Properties::City.order("name ASC")
        @areaCodes = Refinery::Properties::AreaCode.order("name ASC")
        @brokers = Refinery::Brokers::Broker.all
        @properties = Refinery::Properties::Property.order("title ASC");

        #order params
        @propertyTypes = ['Sale', 'Lease']
        @stateCodes = ['Oregon', 'Washington']
        @sortBy = ['Title', 'City', 'Area', 'State']
        @hasOrderBy = false


        #filter parameters
        @filterParams = params[:filter]

        if @filterParams != nil

          if @filterParams['sort_by'] != nil and @filterParams['sort_by'] != ''
            if @filterParams['sort_by'] == 'Title'
              @properties = Refinery::Properties::Property.order("title ASC");
            elsif @filterParams['sort_by'] == 'City'
              @properties = Refinery::Properties::Property.order("city_id ASC");
            elsif @filterParams['sort_by'] == 'Area'
              @properties = Refinery::Properties::Property.order("area_code_id ASC");
            elsif @filterParams['sort_by'] == 'State'
              @properties = Refinery::Properties::Property.order("state_code ASC");
            end
          end


          if @filterParams['keyword'] != nil and @filterParams['keyword'] != ''
            @properties = @properties.where("lower(title) LIKE ? OR lower(highlights) LIKE ?", "%" + @filterParams['keyword'].strip.downcase + "%", "%" + @filterParams['keyword'].strip.downcase + "%")
          end

          if @filterParams['city_id'] != nil and @filterParams['city_id'] != ''
            @properties = @properties.where("city_id = ?", @filterParams['city_id'])
          end

          if @filterParams['state_code'] != nil and @filterParams['state_code'] != ''
            @properties = @properties.where("state_code = ?", @filterParams['state_code'])
          end

          if @filterParams['area_code_id'] != nil and @filterParams['area_code_id'] != ''
            @properties = @properties.where("area_code_id = ?", @filterParams['area_code_id'])
          end

          if @filterParams['property_broker_id'] != nil and @filterParams['property_broker_id'] != ''
            @properties = @properties.joins(:brokers)
            @properties = @properties.where("broker_id = ?", @filterParams['property_broker_id'])
          end


        end

        if @hasOrderBy != true
        end


      end


  end
