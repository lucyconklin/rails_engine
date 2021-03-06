require 'rails_helper'

describe 'Single Merchant Business Intelligence' do
  before(:each) do
    @invoice = create(:invoice)
    invoice_items = create_list(:invoice_item, 3, invoice_id: @invoice.id)
    transactions = create_list(:transaction, 3, invoice_id: @invoice.id)
    @merchant = Invoice.first.merchant
  end

  it 'returns total revenue accross all transactions' do
    get "/api/v1/merchants/#{@merchant.id}/revenue"

    found = JSON.parse(response.body)

    expect(response).to be_success
    expect(found).to have_key("revenue")
    expect(found["revenue"]).to be_a(String)
  end

  it 'returns total revenue from a date for a merchant' do
    get "/api/v1/merchants/#{@merchant.id}/revenue?date=#{@invoice.created_at}"

    found = JSON.parse(response.body)

    expect(response).to be_success
    expect(found).to have_key("revenue")
    expect(found["revenue"]).to be_a(String)
  end
end

describe "All Merchants Business Intelligence" do
  before(:each) do
    @invoice = create(:invoice)
    invoice_items = create_list(:invoice_item, 3, invoice_id: @invoice.id)
    transactions = create_list(:transaction, 3, invoice_id: @invoice.id)
  end

  it "returns total revenue for date accross all merchants" do
    get "/api/v1/merchants/revenue?date=#{@invoice.created_at}"

    found = JSON.parse(response.body)

    expect(response).to be_success
    expect(found).to have_key("total_revenue")
    expect(found["total_revenue"]).to be_a(String)
    expect(found["total_revenue"]).to_not eq("0")
  end
end
