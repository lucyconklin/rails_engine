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
    it "finds one matching item by id" do
      skip
    end

    it "finds one matching item by name" do
      skip
    end

    it "finds one matching item by description" do
      skip
    end

    it "finds one matching item by unit price" do
      skip
    end

    it "finds one matching item by merchant_id" do
      skip
    end

    it "finds one matching item by created_at" do
      skip
    end

    it "finds one matching item by updated_at" do
      skip
    end
  end

  describe "item finds_all by params" do
    it "finds all matching items by id" do
      skip
    end

    it "finds all matching items by name" do
      skip
    end

    it "finds all matching items by description" do
      skip
    end

    it "finds all matching items by unit price" do
      skip
    end

    it "finds all matching items by merchant_id" do
      skip
    end

    it "finds all matching items by created_at" do
      skip
    end

    it "finds all matching items by updated_at" do
      skip
    end
  end
end
