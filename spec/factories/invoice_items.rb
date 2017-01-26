FactoryGirl.define do
  sequence :quantity do |n|
    n%6
  end

  factory :invoice_item do
    invoice
    item
    quantity
    unit_price  Faker::Number.between(1,100000)
  end
end
