require 'rails_helper'

describe 'Single Merchant Business Intelligence' do
  before(:each) do
    invoice = create(:invoice)
    invoice_items = create_list(:invoice_item, 10, invoice_id: invoice.id)
    transactions = create_list(:transaction, 10, invoice_id: invoice.id)
  end

  it 'returns total revenue accross all transactions' do
    merchant = Invoice.first.merchant

    get "/api/v1/merchants/#{merchant.id}/revenue"

  end
end
