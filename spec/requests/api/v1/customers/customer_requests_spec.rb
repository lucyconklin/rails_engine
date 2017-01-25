require 'rails_helper'

describe 'Customers API' do
  before(:each) do
    create_list(:customer, 4)
    @customer_1 = Customer.first
  end

  it 'returns all customers' do

    get '/api/v1/customers'

    customers =  JSON.parse(response.body)
    customer = customers.first

    expect(response).to be_success
    expect(customers.count).to eq(4)
    expect(customer["id"]).to eq(@customer_1.id)
    expect(customer["first_name"]).to eq(@customer_1.first_name)
    expect(customer["last_name"]).to eq(@customer_1.last_name)
    expect(customer).to have_key("created_at")
    expect(customer).to have_key("updated_at")
  end
end
