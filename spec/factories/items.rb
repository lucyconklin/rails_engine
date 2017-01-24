FactoryGirl.define do
  factory :item do
    name { Faker::Space.planet }
    description { Faker::Space.moon }
    unit_price 1000
  end
end
