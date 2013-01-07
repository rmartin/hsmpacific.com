
FactoryGirl.define do
  factory :property, :class => Refinery::Properties::Property do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

