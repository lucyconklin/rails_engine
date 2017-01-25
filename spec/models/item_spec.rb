require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:unit_price) }
  end

  describe "relationships" do
    it { should belong_to(:merchant) }
    it { should have_many(:invoices) }
  end
end
