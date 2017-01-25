def create_invoice_items
  @merchant = create(:merchant)
  @customer = create(:customer)
  @invoice_1 = create(:invoice, merchant_id: @merchant.id, customer_id: @customer.id)
  @invoice_2 = create(:invoice, merchant_id: @merchant.id, customer_id: @customer.id)
  @item_1, @item_2, @item_3 = create_list(:item, 3, merchant_id: @merchant.id)
  @invoice_item_1 = create(:invoice_item, item_id: @item_1.id, invoice: @invoice_1)
  @invoice_item_2 = create(:invoice_item, item_id: @item_2.id, invoice_id: @invoice_2.id)
  @invoice_item_3 = create(:invoice_item, item_id: @item_3.id, invoice_id: @invoice_1.id)
end

def create_merchant_with_items
  @merchant = create(:merchant)
  @merchant_2 = create(:merchant)
  @item_1, @item_2 = create_list(:item, 2, merchant_id: @merchant.id)
  @item_3 = create(:item, merchant_id: @merchant_2.id)
end
