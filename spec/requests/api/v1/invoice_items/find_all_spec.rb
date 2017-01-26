require "rails_helper"
require "api_spec_helper"

describe "Invoice Items API find all" do
  before :each do
    create_invoice_items
  end

  it "finds all invoices item by id" do
    get "/api/v1/invoice_items/find_all?id=#{@invoice_item_1.id}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items).to be_a(Array)
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds all invoice_items by item id" do
    get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item_1.item_id}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items).to be_a(Array)
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds all invoice_items by invoice id" do
    get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_item_1.invoice_id}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items).to be_a(Array)
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds all invoice_items by quantity" do
    get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item_1.quantity}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items).to be_a(Array)
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds all invoice_items by unit_price" do
    get "/api/v1/invoice_items/find_all?unit_price=#{@invoice_item_1.unit_price / 100.0}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items).to be_a(Array)
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds all invoice_items by created_at" do
    get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item_1.created_at}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items).to be_a(Array)
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds all invoice_items by updated_at" do
    get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item_1.updated_at}"

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items).to be_a(Array)
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end
end
