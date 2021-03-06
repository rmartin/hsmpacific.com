module Refinery
  module Properties
    class Property < Refinery::Core::BaseModel
      self.table_name = 'refinery_properties'

      attr_accessible :title, :highlights, :available_sf, :rates, :flyer_id, :position, :city_id, :area_code_id, :state_code, :property_type, :broker_ids

      acts_as_indexed :fields => [:title, :highlights, :available_sf, :rates]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :flyer, :class_name => '::Refinery::Resource'
      
      belongs_to :cities, :class_name => '::Refinery::Properties::City'
      belongs_to :area_codes, :class_name => '::Refinery::Properties::City'
      
      has_many :property_representation
      has_many :brokers, :class_name => ::Refinery::Brokers::Broker, :through => :property_representation
      
    end
  end
end
