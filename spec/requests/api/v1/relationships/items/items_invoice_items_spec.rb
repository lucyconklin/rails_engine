require 'rails_helper'

describe 'Items invoice items relationship' do
  it 'returns collection of associated invoice items' do
    item = create(:item)
    create_list(:invoice_item, 100, item_id: item.id)

    get "/api/v1/items/#{item.id}/invoice_items"

    found = JSON.parse(response.body)

    expect(found.count).to eq(100)
    expect(found).to be_a(Array)
    expect(found.first["id"]).to eq(item.id)
  end
end
