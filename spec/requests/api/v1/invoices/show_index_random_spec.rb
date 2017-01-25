require "rails_helper"

describe "Invoices API main" do
  let!(:merchant) { create(:merchant) }
  let!(:customer) { create(:customer) }
  let!(:item_1) { create(:item, merchant_id: merchant.id) }
  let!(:item_2) { create(:item, merchant_id: merchant.id) }
  let!(:invoice_1) { create(:invoice, merchant_id: merchant.id, customer_id: customer.id) }
  let!(:invoice_2) { create(:invoice, merchant_id: merchant.id, customer_id: customer.id) }

  it "returns all invoices" do
    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(2)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key("id")
    expect(invoice).to have_key("merchant_id")
    expect(invoice).to have_key("customer_id")
    expect(invoice).to have_key("created_at")
    expect(invoice).to have_key("updated_at")
    expect(invoice).to have_key("status")
    expect(invoice["id"]).to be_a(Integer)
    expect(invoice["status"]).to be_a(String)
    expect(invoice["merchant_id"]).to be_a(Integer)
    expect(invoice["customer_id"]).to be_a(Integer)
  end

  it "returns one invoice" do
    get "/api/v1/invoices/#{invoice_1.id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key("id")
    expect(invoice).to have_key("merchant_id")
    expect(invoice).to have_key("customer_id")
    expect(invoice).to have_key("created_at")
    expect(invoice).to have_key("updated_at")
    expect(invoice).to have_key("status")
    expect(invoice["id"]).to be_a(Integer)
    expect(invoice["status"]).to be_a(String)
    expect(invoice["merchant_id"]).to be_a(Integer)
    expect(invoice["customer_id"]).to be_a(Integer)
  end

  it "returns a random invoice" do
    get "/api/v1/invoices/random"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to be_between(1,2).inclusive
    expect(invoice).to have_key("merchant_id")
    expect(invoice).to have_key("customer_id")
    expect(invoice).to have_key("created_at")
    expect(invoice).to have_key("updated_at")
    expect(invoice).to have_key("status")
    expect(invoice["status"]).to be_a(String)
    expect(invoice["merchant_id"]).to be_a(Integer)
    expect(invoice["customer_id"]).to be_a(Integer)
  end
end
