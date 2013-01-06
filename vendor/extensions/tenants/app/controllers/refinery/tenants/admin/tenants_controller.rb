module Refinery
  module Tenants
    module Admin
      class TenantsController < ::Refinery::AdminController
        before_filter :find_all_brokers
        include ActiveModel::MassAssignmentSecurity
        
       
        #before_filter :check_broker_ids, :only => [:update]

        crudify :'refinery/tenants/tenant',
                :title_attribute => 'name', :xhr_paging => true
                    
                        
        protected

          def find_all_brokers
            @brokers = ::Refinery::Brokers::Broker.all
          end
          

        def check_broker_ids
          logger.info("Seeding all devices from admin/sensors_controller new")
          params[:tenant][:broker_ids] ||= []
        end
          
       
      end
    end
  end
end
