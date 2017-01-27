require 'rails_helper'

describe "Customer Business Intelligence favorite merchant" do
  before(:each) do
    @customer = create(:customer)
    create_list(:merchant, 4)
    @merchant = Merchant.first
    invoice_1 = create(:invoice, merchant_id: @merchant.id, customer_id: @customer.id)
    invoice_2 = create(:invoice, merchant_id: @merchant.id, customer_id: @customer.id)
    invoice_3 = create(:invoice, merchant_id: Merchant.last.id)
    create(:transaction, invoice_id: invoice_1.id, result: "success")
    create(:transaction, invoice_id: invoice_2.id, result: "success")
    create(:transaction, invoice_id: invoice_3.id, result: "success")
  end

  it "returns a merchant with highest number of transactions" do
    get "/api/v1/customers/#{@customer.id}/favorite_merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(@merchant.id)
    expect(merchant["name"]).to eq(@merchant.name)
  end
end
