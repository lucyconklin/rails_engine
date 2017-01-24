require 'rails_helper'

describe 'Transactions Single Finder API' do
  before(:each) do
    create_list(:transaction, 4)
    @transaction_1 = Transaction.first
    @transaction_2 = Transaction.last
  end

  it 'finds transaction by id' do
    get "/api/v1/transactions/find?id=#{@transaction_1.id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to be_a(Hash)
    expect(transaction["credit_card_number"]).to eq(@transaction_1.credit_card_number)
  end

  it 'finds transaction by result' do
    get "/api/v1/transactions/find?result=#{@transaction_1.result}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to be_a(Hash)
    expect(transaction["result"]).to eq(@transaction_1.result)
  end

  it 'finds transaction by credit_card_number' do
    get "/api/v1/transactions/find?credit_card_number=#{@transaction_1.credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to be_a(Hash)
    expect(transaction["credit_card_number"]).to eq(@transaction_1.credit_card_number)
  end

  it 'finds transaction by created_at' do
    get "/api/v1/transactions/find?created_at=#{@transaction_1.created_at}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to be_a(Hash)
    expect(transaction["credit_card_number"]).to eq(@transaction_1.credit_card_number)
  end

  it 'finds transaction by updated at' do
    get "/api/v1/transactions/find?updated_at=#{@transaction_1.updated_at}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to be_a(Hash)
    expect(transaction["credit_card_number"]).to eq(@transaction_1.credit_card_number)
  end

end
