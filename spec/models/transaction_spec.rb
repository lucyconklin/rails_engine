require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:result)}
    it { is_expected.to validate_presence_of(:credit_card_number)}
  end

  describe "relationships" do
    it { should belong_to :invoice }
  end
end
