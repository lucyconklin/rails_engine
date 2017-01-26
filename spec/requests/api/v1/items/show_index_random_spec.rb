require "rails_helper"

describe "Items API" do
  it "returns all items" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    item_3 = create(:item, merchant_id: merchant.id)

    get '/api/v1/items'

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(item).to be_a(Hash)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("unit_price")
    expect(item).to have_key("merchant_id")
    expect(item).to have_key("description")
    expect(item["id"]).to be_a(Integer)
    expect(item["name"]).to be_a(String)
    expect(item["description"]).to be_a(String)
    expect(item["unit_price"]).to be_a(String)
    expect(item["merchant_id"]).to be_a(Integer)
  end

  it "returns a specific item" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)

    get '/api/v1/items/1'

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to be_a(Hash)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("unit_price")
    expect(item).to have_key("merchant_id")
    expect(item).to have_key("description")
    expect(item["id"]).to be_a(Integer)
    expect(item["name"]).to be_a(String)
    expect(item["description"]).to be_a(String)
    expect(item["unit_price"]).to be_a(String)
    expect(item["merchant_id"]).to be_a(Integer)
  end

  it "returns a random item" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)

    get '/api/v1/items/random'

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to be_a(Hash)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("unit_price")
    expect(item).to have_key("merchant_id")
    expect(item).to have_key("description")
    expect(item["id"]).to be_a(Integer)
    expect(item["name"]).to be_a(String)
    expect(item["description"]).to be_a(String)
    expect(item["unit_price"]).to be_a(String)
    expect(item["merchant_id"]).to be_a(Integer)
  end
end
