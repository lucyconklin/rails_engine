require 'rails_helper'

describe 'Merchants API find all' do
  before(:each) do
    @merchants = create_list(:merchant, 4)
    @merchant_1 = @merchants.first
    @merchant_4 = @merchants.last
    @past_merchant = create(:merchant, updated_at: Faker::Date.between(2.days.ago, 1.days.ago), created_at: Faker::Date.between(6.days.ago, 5.days.ago))
  end
  it 'finds all merchants by name' do
    get "/api/v1/merchants/find_all?name=#{@merchant_1.name}"

    found = JSON.parse(response.body)

    expect(response).to be_success
    expect(found).to be_a(Array)
    expect(found.first).to be_a(Hash)
    expect(found.first["id"]).to eq(@merchant_1.id)
    expect(found.first["name"]).to eq(@merchant_1.name)
  end

  it 'finds all merchants by created at' do
    get "/api/v1/merchants/find_all?created_at=#{@past_merchant.created_at}"

    found = JSON.parse(response.body)

    expect(response).to be_success
    expect(found).to be_a(Array)
    expect(found.count).to eq(1)
    expect(found.first).to be_a(Hash)
    expect(found.first["id"]).to eq(@past_merchant.id)
    expect(found.first["name"]).to eq(@past_merchant.name)
  end

  it 'finds all merchants by updated at' do
    get "/api/v1/merchants/find_all?created_at=#{@past_merchant.created_at}"

    found = JSON.parse(response.body)

    expect(response).to be_success
    expect(found).to be_a(Array)
    expect(found.count).to eq(1)
    expect(found.first).to be_a(Hash)
    expect(found.first["id"]).to eq(@past_merchant.id)
    expect(found.first["name"]).to eq(@past_merchant.name)
  end
end

describe "Merchants API find random" do
  it 'finds a random merchant' do
    create_list(:merchant, 5)

    get '/api/v1/merchants/random'

    found = JSON.parse(response.body)

    expect(response).to be_success
    expect(found).to be_a(Hash)
    expect(found["id"]).to be_between(1,5).inclusive
  end
end
