FactoryGirl.define do
  sequence :quantity do |n|
    n%6
  end

  sequence :unit_price do |n|
    n%4 * 1000
  end

  factory :invoice_item do
    invoice
    item
    quantity
    unit_price
  end
end
