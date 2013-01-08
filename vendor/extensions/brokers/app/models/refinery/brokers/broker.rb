module Refinery
  module Brokers
    class Broker < Refinery::Core::BaseModel
      self.table_name = 'refinery_brokers'

      attr_accessible :name, :title, :email, :phone, :fax, :headshot_id, :bio, :is_broker, :rank, :position

      acts_as_indexed :fields => [:name, :title, :email, :phone, :fax, :bio]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :headshot, :class_name => '::Refinery::Image'
      
      has_many :tenant_representation
      has_many :tenants, :class_name => ::Refinery::Tenants::Tenant, :through => :tenant_representation
      
      has_many :property_representation
      has_many :properties, :class_name => ::Refinery::Properties::Property, :through => :property_representation
    end
  end
end
