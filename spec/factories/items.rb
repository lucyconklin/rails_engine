FactoryGirl.define do
  factory :item do
    name { Faker::Space.constellation }
    description { Faker::Space.star }
    unit_price 1000
  end
end
