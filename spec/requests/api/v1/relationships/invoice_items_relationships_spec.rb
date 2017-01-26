require 'rails_helper'

describe 'Invoice Items Relationship Endpoints' do
  before(:each) do
    invoice_items = create_list(:invoice_item, 20)
    @invoice_item = invoice_items.sample
  end
  it 'returns the associated invoice' do

    get "/api/v1/invoice_items/#{@invoice_item.id}/invoice"

    found = JSON.parse(response.body)

    expect(found).to be_a(Hash)
    expect(found["id"]).to eq(@invoice_item.invoice_id)
    expect(found).to have_key("merchant_id")
    expect(found).to have_key("customer_id")
    expect(found).to have_key("status")
  end

  it 'returns the associated item' do

    get "/api/v1/invoice_items/#{@invoice_item.id}/item"

    found = JSON.parse(response.body)

    expect(found).to be_a(Hash)
    expect(found["id"]).to eq(@invoice_item.item_id)
    expect(found).to have_key("name")
    expect(found).to have_key("description")
    expect(found).to have_key("unit_price")
    expect(found).to have_key("merchant_id")
  end
end
