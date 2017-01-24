require 'rails_helper'

describe 'Transactions Multi Finder API' do
  before(:each) do
    create_list(:transaction, 4)
    @transaction_1 = Transaction.first
    @transaction_2 = Transaction.last
  end

  it 'finds transaction by id' do
    get "/api/v1/transactions/find_all?id=#{@transaction_1.id}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions).to be_a(Array)
    expect(transactions[0]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
  end

  it 'finds transaction by credit card number' do
    get "/api/v1/transactions/find_all?credit_card_number=#{@transaction_1.credit_card_number}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions).to be_a(Array)
    expect(transactions[0]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
  end

  it 'finds transaction by result' do
    get "/api/v1/transactions/find_all?result=#{@transaction_1.result}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions).to be_a(Array)
    expect(transactions[0]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
  end

  it 'finds transaction by created_at' do
    get "/api/v1/transactions/find_all?created_at=#{@transaction_1.created_at}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions).to be_a(Array)
    expect(transactions[0]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
  end

  it 'finds transaction by updated at' do
    get "/api/v1/transactions/find_all?updated_at=#{@transaction_1.updated_at}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions).to be_a(Array)
    expect(transactions[0]["credit_card_number"]).to eq(@transaction_1.credit_card_number)
  end

end
