module Refinery
  module Properties
    module Admin
      class PropertiesController < ::Refinery::AdminController
        
        before_filter :find_all_cities
        before_filter :find_all_area_codes

        crudify :'refinery/properties/property', :xhr_paging => true
        
        protected
        
          def find_all_cities
            @cities = ::Refinery::Properties::City.all
          end
          
          def find_all_area_codes
            @areaCodes = ::Refinery::Properties::AreaCode.all
          end

      end
    end
  end
end
