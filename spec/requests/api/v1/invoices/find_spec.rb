require "rails_helper"

describe "Invoices API find" do
  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }
  let!(:item_1) { create(:item, merchant_id: merchant_1.id) }
  let!(:item_2) { create(:item, merchant_id: merchant_1.id) }
  let!(:item_3) { create(:item, merchant_id: merchant_2.id) }
  let!(:item_4) { create(:item, merchant_id: merchant_2.id) }

  it "finds one invoice by id" do
    get "/api/v1/invoices/find?id=#{invoice_1.id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(invoice_1.id)
    expect(invoice["merchant_id"]).to eq(merchant_1.id)
    # expect(invoice["customer_id"]).to eq(customer.id)
    expect(invoice["status"]).to eq(invoice_1.status)
  end

  xit "finds one invoice by customer_id" do

  end

  xit "finds one invoice by merchant_id" do

  end

  xit "finds one invoice by status" do

  end

  xit "finds one invoice by created_at" do

  end

  xit "finds one invoice by updated_at" do

  end
end
