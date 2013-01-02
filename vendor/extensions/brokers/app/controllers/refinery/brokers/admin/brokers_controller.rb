module Refinery
  module Brokers
    module Admin
      class BrokersController < ::Refinery::AdminController

        crudify :'refinery/brokers/broker',
                :title_attribute => 'name', 
                :xhr_paging => true,
                :order => "rank ASC",
                :sortable => false
      end
    end
  end
end