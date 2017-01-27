require 'rails_helper'

describe "Merchant Business Intelligence most sold" do
  before(:each) do
    create_list(:merchant, 4)
    @merchant = Merchant.last
    merchant_2 = create(:merchant)
    create_list(:item, 2, merchant_id: merchant_2.id)
    create(:item, merchant_id: @merchant.id)
    invoice_1 = create(:invoice, merchant_id: @merchant.id)
    invoice_2 = create(:invoice, merchant_id: merchant_2.id)
    invoice_item = create(:invoice_item, invoice_id: invoice_1.id, item_id: @merchant.items.first.id, quantity: 10, unit_price: 1000)
    invoice_item = create(:invoice_item, invoice_id: invoice_1.id, item_id:@merchant.items.last.id, quantity: 10, unit_price: 1000)
    invoice_item = create(:invoice_item, invoice_id: invoice_2.id, item_id: merchant_2.items.first.id, quantity: 10, unit_price: 10)
    create(:transaction, invoice_id: invoice_1.id, result: "success")
    create(:transaction, invoice_id: invoice_2.id, result: "success")
  end

  it "returns a merchant ranked by total items sold" do
    get "/api/v1/merchants/most_items"

    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(response).to be_success
    expect(merchant["id"]).to eq(@merchant.id)
    expect(merchant["name"]).to eq(@merchant.name)
  end
  #
  it "returns x merchants ranked by total items sold" do
    get "/api/v1/merchants/most_items?quantity=2"

    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(response).to be_success
    expect(merchants.count).to eq(2)
    expect(merchant["id"]).to eq(@merchant.id)
    expect(merchant["name"]).to eq(@merchant.name)
  end
end
