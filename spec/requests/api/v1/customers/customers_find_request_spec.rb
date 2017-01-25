require 'rails_helper'

describe 'Customers Single Finder API' do
  before(:each) do
    create_list(:customer, 4)
    @customer_1 = Customer.first
  end

  it 'finds customer by id' do
    get "/api/v1/customers/find?id=#{@customer_1.id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer).to be_a(Hash)
    expect(customer["first_name"]).to eq(@customer_1.first_name)
    expect(customer["last_name"]).to eq(@customer_1.last_name)
  end

  it 'finds customer by first name' do
    get "/api/v1/customers/find?first_name=#{@customer_1.first_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer).to be_a(Hash)
    expect(customer["first_name"]).to eq(@customer_1.first_name)
    expect(customer["last_name"]).to eq(@customer_1.last_name)
  end

  it 'finds customer by last_name' do
    get "/api/v1/customers/find?last_name=#{@customer_1.last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer).to be_a(Hash)
    expect(customer["first_name"]).to eq(@customer_1.first_name)
    expect(customer["last_name"]).to eq(@customer_1.last_name)
  end

  it 'finds customer by created_at' do
    get "/api/v1/customers/find?created_at=#{@customer_1.created_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer).to be_a(Hash)
    expect(customer["first_name"]).to eq(@customer_1.first_name)
    expect(customer["last_name"]).to eq(@customer_1.last_name)
  end

  it 'finds customer by updated_at' do
    get "/api/v1/customers/find?updated_at=#{@customer_1.updated_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer).to be_a(Hash)
    expect(customer["first_name"]).to eq(@customer_1.first_name)
    expect(customer["last_name"]).to eq(@customer_1.last_name)
  end

end
