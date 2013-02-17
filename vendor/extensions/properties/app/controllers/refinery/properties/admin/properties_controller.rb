module Refinery
  module Properties
    module Admin
      class PropertiesController < ::Refinery::AdminController
        
        before_filter :find_all_cities
        before_filter :find_all_area_codes
        before_filter :find_all_brokers

        crudify :'refinery/properties/property', :xhr_paging => true,
                                          :order => "title ASC",
                                          :sortable => false
        
        protected
        
          def find_all_cities
            @cities = ::Refinery::Properties::City.all
          end
          
          def find_all_area_codes
            @areaCodes = ::Refinery::Properties::AreaCode.all
          end
          
          def find_all_brokers
             @brokers = ::Refinery::Brokers::Broker.all
          end

      end
    end
  end
end
