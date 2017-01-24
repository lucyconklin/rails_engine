require "rails_helper"

describe "Invoices API find" do
  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }
  let!(:invoice_1) { create(:invoice, merchant_id: merchant_1.id) }
  let!(:invoice_2) { create(:invoice, merchant_id: merchant_1.id) }
  let!(:invoice_3) { create(:invoice, merchant_id: merchant_2.id) }
  let!(:invoice_4) { create(:invoice, merchant_id: merchant_2.id) }

  it "finds one invoice by id" do
    get "/api/v1/invoices/find?id=#{invoice_1.id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["merchant_id"]).to eq(merchant_1.id)
    # expect(invoice["customer_id"]).to eq(customer.id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end

  # xit "finds one invoice by customer_id" do
  #   get "/api/v1/invoices/find?customer_id=#{invoice_2.customer_id}"
  #
  #   invoice = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(invoice["id"]).to eq(invoice_2.id)
  #   expect(invoice["merchant_id"]).to eq(merchant_1.id)
  #   expect(invoice["customer_id"]).to eq(customer.id)
  #   expect(invoice["status"]).to eq(invoice_1.status)
  # end

  it "finds one invoice by merchant_id" do
    get "/api/v1/invoices/find?merchant_id=#{invoice_1.merchant_id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["merchant_id"]).to eq(merchant_1.id)
    # expect(invoice["customer_id"]).to eq(customer.id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end

  it "finds one invoice by status" do
    get "/api/v1/invoices/find?status=#{invoice_1.status}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["merchant_id"]).to eq(merchant_1.id)
    # expect(invoice["customer_id"]).to eq(customer.id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end

  it "finds one invoice by created_at" do
    get "/api/v1/invoices/find?created_at=#{invoice_1.created_at}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["merchant_id"]).to eq(merchant_1.id)
    # expect(invoice["customer_id"]).to eq(customer.id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end

  it "finds one invoice by updated_at" do
    get "/api/v1/invoices/find?updated_at=#{invoice_1.updated_at}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice).to be_a(Hash)
    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["merchant_id"]).to eq(merchant_1.id)
    # expect(invoice["customer_id"]).to eq(customer.id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end
end
