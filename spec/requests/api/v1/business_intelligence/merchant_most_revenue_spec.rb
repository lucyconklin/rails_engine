require 'rails_helper'

describe "Merchant Business Intelligence most revenue" do
  before(:each) do
    create_list(:merchant, 4)
    @merchant = Merchant.last
    invoice_1 = create(:invoice, merchant_id: @merchant.id)
    invoice_2 = create(:invoice, merchant_id: @merchant.id)
    invoice_item = create(:invoice_item, invoice_id: invoice_1.id, item_id: @merchant.items.first.id, quantity: 100, unit_price: 1000)
    invoice_item = create(:invoice_item, invoice_id: invoice_1.id, item_id:@merchant.items.last.id, quantity: 100, unit_price: 1000)
    invoice_item = create(:invoice_item, invoice_id: invoice_2.id, item_id: Merchant.last.items.first.id, quantity: 1, unit_price: 10)
    create(:transaction, invoice_id: invoice_1.id, result: "success")
    create(:transaction, invoice_id: invoice_2.id, result: "success")
  end

  it "returns a merchants ranked by total revenue" do
    get "/api/v1/merchants/most_revenue"

    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(response).to be_success
    expect(merchants.count).to eq(1)
    expect(merchant["id"]).to eq(@merchant.id)
    expect(merchant["name"]).to eq(@merchant.name)
  end

  it "returns x merchants ranked by total revenue" do
    get "/api/v1/merchants/most_revenue?quantity=2"

    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(response).to be_success
    expect(merchants.count).to eq(2)
    expect(merchant["id"]).to eq(@merchant.id)
    expect(merchant["name"]).to eq(@merchant.name)
  end
end
