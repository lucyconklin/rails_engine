require 'rails_helper'

describe 'Invoices Relationship Requests' do
  before(:each) do
    create_list(:invoice, 5)
    @invoice = Invoice.all.sample
  end
  it 'returns collection of transactions by invoice id' do
    create_list(:transaction, 5, invoice_id: @invoice.id)
    create_list(:transaction, 5)

    get "/api/v1/invoices/#{@invoice.id}/transactions"

    found = JSON.parse(response.body)

    expect(Transaction.count).to eq(10)
    expect(found).to be_a(Array)
    expect(found.count).to eq(5)
    expect(found.first["invoice_id"]).to eq(@invoice.id)
  end

  it 'returns a collection of invoice items by invoice id' do
    create_list(:invoice_item, 5, invoice_id: @invoice.id)
    create_list(:invoice_item, 5)

    get "/api/v1/invoices/#{@invoice.id}/invoice_items"

    found = JSON.parse(response.body)

    expect(InvoiceItem.count).to eq(10)
    expect(found).to be_a(Array)
    expect(found.count).to eq(5)
    expect(found.first["invoice_id"]).to eq(@invoice.id)
  end

  it 'returns a collection of items by invoice id' do
    create_list(:invoice_item, 10, invoice_id: @invoice.id)
    create_list(:invoice_item, 10)

    get "/api/v1/invoices/#{@invoice.id}/items"

    found = JSON.parse(response.body)

    expect(Item.count).to eq(20)
    expect(found).to be_a(Array)
    expect(found.count).to eq(10)
    expect(found.first["unit_price"]).to eq(@invoice.items.first.unit_price)
  end

  it 'returns a customer by invoice id' do
    create_list(:customer, 5)
    customer = Customer.find(@invoice.customer_id)

    get "/api/v1/invoices/#{@invoice.id}/customer"

    found = JSON.parse(response.body)

    expect(found).to be_a(Hash)
    expect(found["id"]).to eq(customer.id)
    expect(found["first_name"]).to eq(customer.first_name)
  end
end
