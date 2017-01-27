FactoryGirl.define do
  sequence :name do |n|
   Faker::Space.constellation + n.to_s
  end

  sequence :description do |n|
    Faker::Space.star + n.to_s
  end

  factory :item do
    name
    description
    unit_price  Faker::Number.between(1,100000)
    merchant
    created_at Faker::Date.between(10.days.ago, Date.today)
  end
end
