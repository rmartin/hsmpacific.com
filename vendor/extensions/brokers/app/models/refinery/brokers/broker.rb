module Refinery
  module Brokers
    class Broker < Refinery::Core::BaseModel
      self.table_name = 'refinery_brokers'

      attr_accessible :name, :urlpath, :title, :email, :phone, :fax, :headshot_id, :professional_experience, :assignments, :clients, :affiliations, :is_active, :is_broker, :rank, :position

      acts_as_indexed :fields => [:name, :urlpath, :title, :email, :phone, :fax, :professional_experience, :assignments, :clients, :affiliations]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :headshot, :class_name => '::Refinery::Image'
      
      has_many :tenant_representation
      has_many :tenants, :class_name => ::Refinery::Tenants::Tenant, :through => :tenant_representation
    end
  end
end
