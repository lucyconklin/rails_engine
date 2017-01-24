FactoryGirl.define do
  sequence :status do |n|
    statuses = ["shipped", "pending", "paid"]
    statuses[n%3]
  end

  factory :invoice do
    merchant_id 1
    status
  end
end
