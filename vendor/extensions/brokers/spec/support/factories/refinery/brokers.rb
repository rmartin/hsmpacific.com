
FactoryGirl.define do
  factory :broker, :class => Refinery::Brokers::Broker do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

