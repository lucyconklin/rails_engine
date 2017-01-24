require 'rails_helper'

describe 'Transactions API' do
  before(:each) do
    create_list(:transaction, 4)
    @transaction_5 = create(:transaction)
  end
  it 'returns all transactions' do

    get '/api/v1/transactions'

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(5)
    expect(transaction["id"]).to eq(1)
    expect(transaction).to have_key("invoice_id")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction).to have_key("credit_card_expiration_date")
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("created_at")
    expect(transaction).to have_key("updated_at")
  end

  it 'returns a specific transaction' do
    get '/api/v1/transactions/5'

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(5)
    expect(transaction).to have_key("invoice_id")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction["credit_card_number"]).to eq(@transaction_5.credit_card_number)
    expect(transaction).to have_key("credit_card_expiration_date")
    expect(transaction).to have_key("result")
    expect(transaction).to have_key("created_at")
    expect(transaction).to have_key("updated_at")

  end
end
