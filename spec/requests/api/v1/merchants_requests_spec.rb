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

  it "returns a specific merchant" do
    merchants = create_list(:merchant, 4)
    first_merchant = merchants.first
    last_merchant = merchants.last

    get '/api/v1/merchants/1'

    merchant_1 = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant_1).to be_a(Hash)
    expect(merchant_1).to have_key("id")
    expect(merchant_1).to have_key("name")
    expect(merchant_1).to have_key("created_at")
    expect(merchant_1).to have_key("updated_at")
    expect(merchant_1["id"]).to be_a(Integer)
    expect(merchant_1["id"]).to eq(first_merchant["id"])
    expect(merchant_1["name"]).to be_a(String)
    expect(merchant_1["name"]).to eq(first_merchant["name"])

    get '/api/v1/merchants/4'

    merchant_4 = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant_4).to be_a(Hash)
    expect(merchant_4).to have_key("id")
    expect(merchant_4).to have_key("name")
    expect(merchant_4).to have_key("created_at")
    expect(merchant_4).to have_key("updated_at")
    expect(merchant_4["id"]).to be_a(Integer)
    expect(merchant_4["id"]).to eq(last_merchant["id"])
    expect(merchant_4["name"]).to be_a(String)
    expect(merchant_4["name"]).to eq(last_merchant["name"])
  end

  it 'finds merchants by name' do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?name=#{merchant.name}"

    merchant_1 = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant_1).to be_a(Hash)
    expect(merchant_1).to have_key("id")
    expect(merchant_1).to have_key("name")
    expect(merchant_1).to have_key("created_at")
    expect(merchant_1).to have_key("updated_at")
    expect(merchant_1["id"]).to be_a(Integer)
    expect(merchant_1["name"]).to be_a(String)
  end
end
