require 'rails_helper'

describe 'Merchants API find all' do
  before(:each) do
    @merchants = create_list(:merchant, 4)
    @merchant_1 = @merchants.first
    @merchant_4 = @merchants.last
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
end
