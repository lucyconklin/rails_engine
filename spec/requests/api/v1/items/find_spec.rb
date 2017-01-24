require "rails_helper"

describe "Items API find" do
  let!(:merchant) { create(:merchant) }
  let!(:item_1) { create(:item, merchant_id: merchant.id) }
  let!(:item_2) { create(:item, merchant_id: merchant.id) }

  it "finds one matching item by id" do
    get "/api/v1/items/find?id=#{item_1.id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(item_1.id)
    expect(item["name"]).to eq(item_1.name)
    expect(item["description"]).to eq(item_1.description)
    expect(item["unit_price"]).to eq(item_1.unit_price)
  end

  it "finds one matching item by name" do
    get "/api/v1/items/find?name=#{item_2.name}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(item_2.id)
    expect(item["name"]).to eq(item_2.name)
    expect(item["description"]).to eq(item_2.description)
    expect(item["unit_price"]).to eq(item_2.unit_price)
  end

  it "finds one matching item by description" do
    get "/api/v1/items/find?description=#{item_2.description}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(item_2.id)
    expect(item["name"]).to eq(item_2.name)
    expect(item["description"]).to eq(item_2.description)
    expect(item["unit_price"]).to eq(item_2.unit_price)
  end

  it "finds one matching item by unit price" do
    get "/api/v1/items/find?unit_price=#{item_1.unit_price}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(item_1.id)
    expect(item["name"]).to eq(item_1.name)
    expect(item["description"]).to eq(item_1.description)
    expect(item["unit_price"]).to eq(item_1.unit_price)
  end

  it "finds one matching item by merchant_id" do
    merchant_2 = create(:merchant)
    item_3 = create(:item, merchant_id: merchant_2.id)
    item_4 = create(:item, merchant_id: merchant_2.id)

    get "/api/v1/items/find?merchant_id=#{item_3.merchant_id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(item_3.id)
    expect(item["name"]).to eq(item_3.name)
    expect(item["description"]).to eq(item_3.description)
    expect(item["unit_price"]).to eq(item_3.unit_price)
  end

  xit "finds one matching item by created_at" do
    get "/api/v1/items/find?created_at=#{item_1.created_at}"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(item_1.id)
    expect(item["name"]).to eq(item_1.name)
    expect(item["description"]).to eq(item_1.description)
    expect(item["unit_price"]).to eq(item_1.unit_price)
  end

  it "finds one matching item by updated_at" do
    skip
  end
end
