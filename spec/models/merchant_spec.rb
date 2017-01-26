require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name)}
  end

  describe "relationships" do
    it { should have_many(:invoices) }
    it { should have_many(:items) }
    it { should have_many(:customers) }
  end
end
