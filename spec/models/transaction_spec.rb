require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:result)}
    it { is_expected.to validate_presence_of(:credit_card_number)}
  end

  describe "relationships" do
    it { should belong_to :invoice }
  end

  describe "methods" do
    it "can select successful transactions" do
      transaction = create(:transaction, result: "failed")
      create_list(:transaction, 3, result: "success")

      all_transactions = Transaction.all
      successful_transactions = Transaction.success

      expect(successful_transactions.count).to eq(3)
      expect(all_transactions.count).to eq(4)
    end
  end
end
