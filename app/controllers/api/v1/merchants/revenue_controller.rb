class Api::V1::Merchants::RevenueController < ApplicationController

  def show
     render json: Merchant.find(params[:id])
     .invoices.joins(:transactions, :invoice_items)
     .where(transactions: {result: "success"})
     .sum("invoice_items.unit_price * invoice_items.quantity"),
     serializer: SingleMerchantSerializer

  end
end
