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
    expect(item["unit_price"]).to be_a(Integer)
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
    expect(item["unit_price"]).to be_a(Integer)
    expect(item["merchant_id"]).to be_a(Integer)
  end

  describe "item find by params" do

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
      expect(item["id"]).to eq(item_4.id)
      expect(item["name"]).to eq(item_4.name)
      expect(item["description"]).to eq(item_4.description)
      expect(item["unit_price"]).to eq(item_4.unit_price)
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

  describe "item finds_all by params" do

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
      item_4 = create(:item, merchant_id: merchant.id)

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
      items.each do |item|
        expect(item['merchant_id']).to eq(item_3.merchant_id)
      end
    end

    it "finds all matching items by created_at" do
      skip
    end

    it "finds all matching items by updated_at" do
      skip
    end
  end
end
