require 'rails_helper'

describe "Item Business Intelligence total revenue" do
  before(:each) do
    create_list(:item, 2)
    @item = create(:item)
    @item_1 = create(:item)
    invoice_1 = create(:invoice, merchant_id: @item.merchant.id)
    invoice_2 = create(:invoice, merchant_id: @item_1.merchant.id)
    invoice_item = create(:invoice_item, invoice_id: invoice_1.id, item_id: @item.id, quantity: 1, unit_price: 1000)
    invoice_item = create(:invoice_item, invoice_id: invoice_2.id, item_id:@item.id, quantity: 10, unit_price: 1000)
    invoice_item = create(:invoice_item, invoice_id: invoice_1.id, item_id: @item_1.id, quantity: 14, unit_price: 10)
    create(:transaction, invoice_id: invoice_1.id, result: "success")
    create(:transaction, invoice_id: invoice_2.id, result: "success")
  end

  it "returns one item with top quantity sold" do
    get "/api/v1/items/most_items"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(item["id"]).to eq(@item_1.id)
    expect(item["name"]).to eq(@item_1.name)
  end

  it "returns x items ranked by top quantity sold" do
    get "/api/v1/items/most_items?quantity=2"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(2)
    expect(item["id"]).to eq(@item_1.id)
    expect(item["name"]).to eq(@item_1.name)
  end
end
