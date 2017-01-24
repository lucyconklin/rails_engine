require "rails_helper"

describe "Invoices API find all" do
  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }
  let!(:invoice_1) { create(:invoice, merchant_id: merchant_1.id) }
  let!(:invoice_2) { create(:invoice, merchant_id: merchant_1.id) }
  let!(:invoice_3) { create(:invoice, merchant_id: merchant_2.id) }
  let!(:invoice_4) { create(:invoice, merchant_id: merchant_2.id) }

  it "finds all invoices by id" do
    get "/api/v1/invoices/find_all?id=#{invoice_1.id}"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices).to be_a(Array)
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["merchant_id"]).to eq(merchant_1.id)
    # expect(invoice["customer_id"]).to eq(customer.id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end

  # xit "finds all invoices by customer_id" do
  #   get "/api/v1/invoices/find_all?customer_id=#{invoice_2.customer_id}"
  #
  #   invoices = JSON.parse(response.body)
  #   invoice = invoices.first
  #
  #   expect(response).to be_success
  #   expect(invoices).to be_at(Array)
  #   expect(invoice).to be_a(Hash)
  #   expect(invoice["id"]).to eq(invoice_2.id)
  #   expect(invoice["merchant_id"]).to eq(merchant_1.id)
  #   expect(invoice["customer_id"]).to eq(customer.id)
  #   expect(invoice["status"]).to eq(invoice_1.status)
  # end

  it "finds all invoices by merchant_id" do
    get "/api/v1/invoices/find_all?merchant_id=#{invoice_1.merchant_id}"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices).to be_a(Array)
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["merchant_id"]).to eq(merchant_1.id)
    # expect(invoice["customer_id"]).to eq(customer.id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end

  it "finds all invoices by status" do
    get "/api/v1/invoices/find_all?status=#{invoice_1.status}"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["merchant_id"]).to eq(merchant_1.id)
    # expect(invoice["customer_id"]).to eq(customer.id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end

  it "finds all invoices by created_at" do
    get "/api/v1/invoices/find_all?created_at=#{invoice_1.created_at}"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices).to be_a(Array)
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["merchant_id"]).to eq(merchant_1.id)
    # expect(invoice["customer_id"]).to eq(customer.id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end

  it "finds all invoices by updated_at" do
    get "/api/v1/invoices/find_all?updated_at=#{invoice_1.updated_at}"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices).to be_a(Array)
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["merchant_id"]).to eq(merchant_1.id)
    # expect(invoice["customer_id"]).to eq(customer.id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end
end
