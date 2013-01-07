
FactoryGirl.define do
  factory :area_code, :class => Refinery::Properties::AreaCode do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

