require 'rails_helper'

describe "Relationship endpoint customer invoices" do
  before :each do
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    invoice_1 = create(:invoice, customer_id: @customer_1.id)
    invoice_2 = create(:invoice, customer_id: @customer_1.id)
    invoice_3 = create(:invoice, customer_id: @customer_2.id)
    invoice_4 = create(:invoice, customer_id: @customer_3.id)
  end

  it "returns a collection of invoices associated with that customer" do
    get "/api/v1/customers/#{@customer_1.id}/invoices"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(2)
    expect(invoices).to be_a(Array)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key("id")
    expect(invoice["customer_id"]).to eq(@customer_1.id)
    expect(invoice).to have_key("customer_id")
    expect(invoice).to have_key("status")
  end
end
