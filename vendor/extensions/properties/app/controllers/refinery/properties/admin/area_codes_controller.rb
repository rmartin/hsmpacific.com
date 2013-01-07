module Refinery
  module Properties
    module Admin
      class AreaCodesController < ::Refinery::AdminController

        crudify :'refinery/properties/area_code',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
