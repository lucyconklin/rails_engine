require "rails_helper"

describe "Items API find all" do
  let!(:merchant) { create(:merchant) }
  let!(:item_1) { create(:item, merchant_id: merchant.id) }
  let!(:item_2) { create(:item, merchant_id: merchant.id) }

  it "finds all matching items by id" do
    get "/api/v1/items/find_all?id=#{item_1.id}"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items).to be_a(Array)
    expect(item).to be_a(Hash)
    expect(item["id"]).to eq(item_1.id)
    expect(item["name"]).to eq(item_1.name)
    expect(item["description"]).to eq(item_1.description)
    expect(item["unit_price"]).to eq(item_1.unit_price)
  end

  it "finds all matching items by name" do
    item_3 = create(:item, name: item_1.name, merchant_id: merchant.id)
    item_4 = create(:item, name: item_2.name, merchant_id: merchant.id)

    get "/api/v1/items/find_all?name=#{item_1.name}"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items).to be_a(Array)
    expect(items.count).to eq(2)
    expect(items.first['name']).to eq(item_1.name)
  end

  it "finds all matching items by description" do
    get "/api/v1/items/find_all?description=#{item_1.description}"

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items).to be_a(Array)
    expect(item).to be_a(Hash)
    expect(item["description"]).to eq(item_1.description)
  end

  it "finds all matching items by unit price" do
    get "/api/v1/items/find_all?unit_price=#{item_1.unit_price}"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items).to be_a(Array)
    expect(items.count).to eq(2)
    expect(items.first['unit_price']).to eq(item_1.unit_price)
  end

  it "finds all matching items by merchant_id" do
    merchant_2 = create(:merchant)
    item_3 = create(:item, merchant_id: merchant_2.id)
    item_4 = create(:item, merchant_id: merchant_2.id)

    get "/api/v1/items/find_all?merchant_id=#{merchant_2.id}"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items).to be_a(Array)
    expect(items.count).to eq(2)
    expect(items.first['merchant_id']).to eq(item_3.merchant_id)
    expect(items.last['merchant_id']).to eq(item_3.merchant_id)
  end

  it "finds all matching items by created_at" do
    skip
  end

  it "finds all matching items by updated_at" do
    skip
  end
end
