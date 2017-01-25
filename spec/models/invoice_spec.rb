require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { is_expected.to validate_presence_of(:status) }

  describe "relationships" do
    it { should belong_to :merchant }
    it { should belong_to :customer }
    it { should have_many :transactions }
  end
end
