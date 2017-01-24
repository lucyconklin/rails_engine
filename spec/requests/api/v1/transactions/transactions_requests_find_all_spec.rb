require 'rails_helper'

describe 'Transactions Multi Finder API' do
  before(:each) do
    create_list(:transaction, 4)
    @transaction_1 = Transaction.first
    @transaction_2 = Transaction.last
  end

  it 'finds transaction by id' do
    get "/api/v1/transactions/find_all?id=#{@transaction_1.id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to be_a(Hash)
    expect(transaction["credit_card_number"]).to eq(@transaction_1.credit_card_number)

  end
end
