require "rails_helper"
require "api_spec_helper"

describe "Invoice Items API find" do
  before :each do
    create_invoice_items
  end

  it "finds one invoice item by id" do
    get "/api/v1/invoice_items/find?id=#{@invoice_item_1.id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["invoice_id"]).to eq(@invoice_1.id)
    expect(invoice_item["item_id"]).to eq(@item_1.id)
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds one invoice_item by item id" do
    get "/api/v1/invoice_items/find?item_id=#{@invoice_item_1.item_id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["invoice_id"]).to eq(@invoice_1.id)
    expect(invoice_item["item_id"]).to eq(@item_1.id)
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds one invoice_item by invoice id" do
    get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item_1.invoice_id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["invoice_id"]).to eq(@invoice_1.id)
    expect(invoice_item["item_id"]).to eq(@item_1.id)
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds one invoice_item by quantity" do
    get "/api/v1/invoice_items/find?quantity=#{@invoice_item_1.quantity}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["invoice_id"]).to eq(@invoice_1.id)
    expect(invoice_item["item_id"]).to eq(@item_1.id)
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds one invoice_item by unit_price" do
    get "/api/v1/invoice_items/find?unit_price=#{@invoice_item_1.unit_price}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["invoice_id"]).to eq(@invoice_1.id)
    expect(invoice_item["item_id"]).to eq(@item_1.id)
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds one invoice_item by created_at" do
    get "/api/v1/invoice_items/find?created_at=#{@invoice_item_1.created_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["invoice_id"]).to eq(@invoice_1.id)
    expect(invoice_item["item_id"]).to eq(@item_1.id)
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "finds one invoice_item by updated_at" do
    get "/api/v1/invoice_items/find?updated_at=#{@invoice_item_1.updated_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item["id"]).to eq(@invoice_item_1.id)
    expect(invoice_item["invoice_id"]).to eq(@invoice_1.id)
    expect(invoice_item["item_id"]).to eq(@item_1.id)
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end
end
