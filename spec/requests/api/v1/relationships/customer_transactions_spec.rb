require 'rails_helper'

describe "Relationship endpoint customer transactions" do
  before :each do
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    invoice_1 = create(:invoice, customer_id: @customer_1.id)
    invoice_2 = create(:invoice, customer_id: @customer_1.id)
    invoice_3 = create(:invoice, customer_id: @customer_2.id)
    invoice_4 = create(:invoice, customer_id: @customer_3.id)
    create(:transaction, invoice_id: invoice_1.id, result: "success")
    create(:transaction, invoice_id: invoice_2.id, result: "success")
    create(:transaction, invoice_id: invoice_3.id, result: "success")
    create(:transaction, invoice_id: invoice_4.id, result: "success")
  end

  it "returns a collection of transactions associated with that customer" do
    get "/api/v1/customers/#{@customer_1.id}/transactions"

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(2)
    expect(transactions).to be_a(Array)
    expect(transaction).to be_a(Hash)
    expect(transaction).to have_key("id")
    expect(transaction["invoice_id"]).to be_between(1,2).inclusive
    expect(transaction).to have_key("invoice_id")
    expect(transaction).to have_key("result")
  end
end
