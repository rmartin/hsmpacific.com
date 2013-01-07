module Refinery
  module Properties
    module Admin
      class CitiesController < ::Refinery::AdminController

        crudify :'refinery/properties/city',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
