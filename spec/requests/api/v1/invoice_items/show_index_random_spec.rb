require "rails_helper"
require "api_spec_helper"

describe "Invoice_items API" do
  before :each do
    create_invoice_items
  end

  it "returns all invoice_items" do
    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
    expect(invoice_item["id"]).to be_a(Integer)
    expect(invoice_item["item_id"]).to be_a(Integer)
    expect(invoice_item["invoice_id"]).to be_a(Integer)
    expect(invoice_item["quantity"]).to be_a(Integer)
    expect(invoice_item["unit_price"]).to be_a(Integer)
  end

  it "returns a specific invoice_item" do
    get '/api/v1/invoice_items/1'

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
    expect(invoice_item["id"]).to be_a(Integer)
    expect(invoice_item["item_id"]).to be_a(Integer)
    expect(invoice_item["invoice_id"]).to be_a(Integer)
    expect(invoice_item["quantity"]).to be_a(Integer)
    expect(invoice_item["unit_price"]).to be_a(Integer)
  end

  it "returns a random invoice_item" do
    get '/api/v1/invoice_items/random'

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item["id"]).to be_between(1,3).inclusive
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
    expect(invoice_item["id"]).to be_a(Integer)
    expect(invoice_item["item_id"]).to be_a(Integer)
    expect(invoice_item["invoice_id"]).to be_a(Integer)
    expect(invoice_item["quantity"]).to be_a(Integer)
    expect(invoice_item["unit_price"]).to be_a(Integer)
  end
end
