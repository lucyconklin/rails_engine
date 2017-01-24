FactoryGirl.define do
  factory :transaction do
    invoice_id nil
    credit_card_number 1
    credit_card_expiration_date "MyString"
    status "MyString"
  end
end
