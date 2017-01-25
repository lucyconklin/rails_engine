require 'rails_helper'

describe 'Customers Multiple Finder API' do
  before(:each) do
    create_list(:customer, 4)
    @customer_1 = Customer.first
  end

  it 'finds customer by id' do
    get "/api/v1/customers/find_all?id=#{@customer_1.id}"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers).to be_a(Array)
    expect(customers[0]["first_name"]).to eq(@customer_1.first_name)
    expect(customers[0]["last_name"]).to eq(@customer_1.last_name)
    expect(customers[0]).to have_key("created_at")
    expect(customers[0]).to have_key("updated_at")
  end

  it 'finds customer by first name' do
    get "/api/v1/customers/find_all?first_name=#{@customer_1.first_name}"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers).to be_a(Array)
    expect(customers[0]["first_name"]).to eq(@customer_1.first_name)
    expect(customers[0]["last_name"]).to eq(@customer_1.last_name)
    expect(customers[0]).to have_key("created_at")
    expect(customers[0]).to have_key("updated_at")
  end

  it 'finds customer by last name' do
    get "/api/v1/customers/find_all?last_name=#{@customer_1.last_name}"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers).to be_a(Array)
    expect(customers[0]["first_name"]).to eq(@customer_1.first_name)
    expect(customers[0]["last_name"]).to eq(@customer_1.last_name)
    expect(customers[0]).to have_key("created_at")
    expect(customers[0]).to have_key("updated_at")
  end

  it 'finds customer by created at' do
    get "/api/v1/customers/find_all?created_at=#{@customer_1.created_at}"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers).to be_a(Array)
    expect(customers[0]["first_name"]).to eq(@customer_1.first_name)
    expect(customers[0]["last_name"]).to eq(@customer_1.last_name)
    expect(customers[0]).to have_key("created_at")
    expect(customers[0]).to have_key("updated_at")
  end

  it 'finds customer by updated at' do
    get "/api/v1/customers/find_all?updated_at=#{@customer_1.updated_at}"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers).to be_a(Array)
    expect(customers[0]["first_name"]).to eq(@customer_1.first_name)
    expect(customers[0]["last_name"]).to eq(@customer_1.last_name)
    expect(customers[0]).to have_key("created_at")
    expect(customers[0]).to have_key("updated_at")
  end

end
