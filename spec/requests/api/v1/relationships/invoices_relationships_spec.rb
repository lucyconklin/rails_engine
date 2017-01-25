require 'rails_helper'

describe 'Invoices Relationship Requests' do
  it 'returns collection of transactions by invoice id' do
    invoice = create(:invoice)
    create_list(:transaction, 5, invoice_id: invoice.id)
    create_list(:transaction, 5)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    found = JSON.parse(response.body)

    expect(Transaction.count).to eq(10)
    expect(found).to be_a(Array)
    expect(found.count).to eq(5)
    expect(found.first["invoice_id"]).to eq(invoice.id)
  end

  it 'returns a collection of invoice items by invoice id' do
    create_list(:invoice, 5)
    invoice = Invoice.all.sample
    create_list(:invoice_item, 5, invoice_id: invoice.id)
    create_list(:invoice_item, 5)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    found = JSON.parse(response.body)

    expect(InvoiceItem.count).to eq(10)
    expect(found).to be_a(Array)
    expect(found.count).to eq(5)
    expect(found.first["invoice_id"]).to eq(invoice.id)
  end
end
