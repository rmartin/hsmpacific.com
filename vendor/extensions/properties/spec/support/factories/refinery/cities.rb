
FactoryGirl.define do
  factory :city, :class => Refinery::Properties::City do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

