
FactoryGirl.define do
  factory :tenant, :class => Refinery::Tenants::Tenant do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

