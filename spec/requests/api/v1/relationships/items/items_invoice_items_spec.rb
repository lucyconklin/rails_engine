require 'rails_helper'

describe 'Items invoice items relationship' do
  it 'returns collection of associated invoice items' do
    invoice = create(:invoice)
    create_list(:invoice_item, 100, invoice_id: invoice.id)
    item = invoice.items.first

    get "/api/v1/items/#{invoice.id}/invoice_items"

    found = JSON.parse(response.body)

    expect(found.count).to eq(100)
    expect(found).to be_a(Array)
    expect(found[0].id).to eq(item.id)
    expect(found[0].name).to eq(item.name)
  end
end
