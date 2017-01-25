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
end
