FactoryGirl.define do
  sequence :name do |n|
   Faker::Space.constellation + n.to_s
  end

  sequence :description do |n|
    Faker::Space.star + n.to_s
  end

  factory :item do
    name
    description { Faker::Space.star }
    unit_price 1000
    merchant
  end
end
