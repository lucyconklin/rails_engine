class Api::V1::Merchants::RevenueController < ApplicationController

  def show
     merchant = Merchant.find(params[:id])
     merchant.invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}) .sum("invoice_items.unit_price * invoice_items.quantity)")
  end
end
