class PropertyRepresentation < ActiveRecord::Base
  attr_accessible :broker_id, :property_id
  belongs_to :property, :class_name => ::Refinery::Properties::Property
  belongs_to :broker, :class_name => ::Refinery::Brokers::Broker

end
