class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    if params[:date]
      render json: Merchant.find(params[:id]).invoices
      .where(created_at: params[:date]).joins(:transactions, :invoice_items)
      .merge(Transaction.success)
      .sum("invoice_items.unit_price * invoice_items.quantity"),
      serializer: SingleMerchantSerializer
    else
     render json: Merchant.find(params[:id]).total_revenue,
     serializer: SingleMerchantSerializer
   end
  end
end
