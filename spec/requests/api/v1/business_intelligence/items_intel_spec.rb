require "rails_helper"

describe 'Items Business Intelligence Endpoints' do
  before(:each) do
    create_list(:invoice_item, 100)
    @item = Item.all.sample
  end
  it 'returns the date with the most sales for given item' do
    get "/api/v1/items/#{@item.id}/best_day"

    found = JSON.parse(response.body)

    expect(response).to be_success
    expect(found).to be_a(String)
  end
end
