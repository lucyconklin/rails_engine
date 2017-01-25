require 'rails_helper'
require 'api_spec_helper'

describe "Relationship endpoint merchant invoices" do
  before :each do
    create_invoice_items
    merchant_2 = create(:merchant)
    @invoice_3 = create(:invoice, merchant_id: merchant_2.id, customer_id: @customer.id)
  end

  it "returns a collection of invoices associated with that merchant" do
    get "/api/v1/merchants/#{@merchant.id}/invoices"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(2)
    expect(invoices).to be_a(Array)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key("id")
    expect(invoice["merchant_id"]).to eq(@merchant.id)
    expect(invoice).to have_key("customer_id")
    expect(invoice).to have_key("status")
  end
end
