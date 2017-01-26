require 'rails_helper'

describe "Merchant Business Intelligence favorite customer" do
  before(:each) do
    create_list(:merchant, 4)
    @merchant = Merchant.last
    @customer = create(:customer)
    invoice_1 = create(:invoice, merchant_id: @merchant.id, customer_id: @customer.id)
    invoice_2 = create(:invoice, merchant_id: @merchant.id, customer_id: @customer.id)
    invoice_3 = create(:invoice, merchant_id: @merchant.id)
    create(:transaction, invoice_id: invoice_1.id, result: "success")
    create(:transaction, invoice_id: invoice_2.id, result: "success")
    create(:transaction, invoice_id: invoice_3.id, result: "success")
  end

  it "returns a customer with highest number of transactions" do
    get "/api/v1/merchants/#{@merchant.id}/favorite_customer"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(@customer.id)
    expect(customer["first_name"]).to eq(@customer.first_name)
    expect(customer["last_name"]).to eq(@customer.last_name)
  end
end
