module Refinery
  module Tenants
    class Tenant < Refinery::Core::BaseModel
      self.table_name = 'refinery_tenants'

      attr_accessible :name, :logo_id, :position, :broker_ids, :is_exclusive_tenant

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'
      
      has_many :tenant_representation
      has_many :brokers, :class_name => ::Refinery::Brokers::Broker, :through => :tenant_representation
    end
  end
end
