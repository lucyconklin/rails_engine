require 'rails_helper'

describe "Relationship endpoint merchant items" do
  before :each do
    @merchant = create(:merchant)
    @merchant_2 = create(:merchant)
    @item_1, @item_2 = create_list(:item, 2, merchant_id: @merchant.id)
    @item_3 = create(:item, merchant_id: @merchant_2.id)
  end
  it "returns a collection of items associated with that merchant" do
    get "/api/v1/merchants/#{@merchant.id}/items"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(2)
    expect(items).to be_a(Array)
    expect(item).to be_a(Hash)
    expect(item).to have_key("id")
    expect(item.merchant).to eq(@merchant)
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("created_at")
    expect(item).to have_key("updated_at")
  end
end
