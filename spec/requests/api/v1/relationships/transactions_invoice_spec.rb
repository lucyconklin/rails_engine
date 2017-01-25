require 'rails_helper'

describe "Relationship endpoint transaction invoice" do
  before :each do
    @invoice = create(:invoice)
    @transaction = create(:transaction, invoice_id: @invoice.id)
  end

  it "returns the associated invoice" do
    get "/api/v1/transactions/#{@transaction.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to eq(@invoice.id)
    expect(invoice["merchant_id"]).to eq(@invoice.merchant_id)
    expect(invoice["status"]).to eq(@invoice.status)
    expect(invoice["customer_id"]).to eq(@invoice.customer_id)
  end
end
