require 'rails_helper'
require 'api_spec_helper'

describe "Relationship endpoint merchant items" do
  before :each do
    create_merchant_with_items
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
    expect(item["merchant_id"]).to eq(@merchant.id)
    expect(item).to have_key("name")
    expect(item).to have_key("description")
  end
end
