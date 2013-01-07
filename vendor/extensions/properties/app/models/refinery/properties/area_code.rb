module Refinery
  module Properties
    class AreaCode < Refinery::Core::BaseModel

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
      has_many :property, :class_name => '::Refinery::Properties::Property'
    end
  end
end
