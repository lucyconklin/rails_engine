def create_invoice_items
  @merchant = create(:merchant)
  @invoice_1 = create(:invoice, merchant_id: @merchant.id)
  @invoice_2 = create(:invoice, merchant_id: @merchant.id)
  @item_1, @item_2, @item_3 = create_list(:item, 3, merchant_id: @merchant.id)
  @invoice_item_1 = create(:invoice_item, item_id: @item_1.id, invoice: @invoice_1)
  @invoice_item_2 = create(:invoice_item, item_id: @item_2.id, invoice_id: @invoice_2.id)
  @invoice_item_3 = create(:invoice_item, item_id: @item_3.id, invoice_id: @invoice_1.id)
end
