FactoryGirl.define do
  sequence :quantity do |n|
    n%6
  end

  # sequence :unit_price do |n|
  #   (n%4 + 1) * 1000
  # end

  factory :invoice_item do
    invoice
    item
    quantity
    unit_price  Faker::Number.decimal(2)
  end
end
