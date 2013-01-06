class TenantRepresentation < ActiveRecord::Base
  attr_accessible :broker_id, :tenant_id
  belongs_to :broker, :class_name => ::Refinery::Brokers::Broker
  belongs_to :tenant, :class_name => ::Refinery::Tenants::Tenant

end
