class Api::V1::Items::BestDayController < ApplicationController

  def show
    render json: Item.find(params[:id]).invoices.joins(:invoice_items).group("invoices.id").order("sum(invoice_items.quantity) DESC").first.created_at,
    serializer: ItemBestDaySerializer
  end
end
