FactoryGirl.define do
  factory :transaction do
    credit_card_number Faker::Number.number(16)
    credit_card_expiration_date ""
    status ["success", "failed"].sample
  end
end
