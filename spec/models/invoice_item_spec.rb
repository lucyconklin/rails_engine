require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:unit_price) }
  end

  describe "relationships" do
    it { should belong_to(:item) }
    it { should belong_to(:invoice) }
  end
end
