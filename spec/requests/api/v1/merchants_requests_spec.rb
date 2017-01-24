require 'rails_helper'

describe "Merchants API" do
  it "returns all merchants" do
    create_list(:merchant, 4)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(response).to be_success
    expect(merchants.count).to eq(4)
    expect(merchant).to be_a(Hash)
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
    expect(merchant).to have_key("created_at")
    expect(merchant["id"]).to be_a(Integer)
    expect(merchant["name"]).to be_a(String)
  end

  it "returns a merchant" do
    create(:merchant)

    get '/api/v1/merchant/1'

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant).to be_a(Hash)
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
    expect(merchant).to have_key("created_at")
    expect(merchant).to have_key("updated_at")
    expect(merchant["id"]).to be_a(Integer)
    expect(merchant["name"]).to be_a(String)
  end
end
