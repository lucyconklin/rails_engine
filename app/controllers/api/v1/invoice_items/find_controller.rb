class Api::V1::InvoiceItems::FindController < ApplicationController
  def show
    render json: InvoiceItem.where(find_params).first
  end

  def index
    render json: InvoiceItem.where(find_params)
  end

  private

  def find_params
    params.permit(:id, :invoice_id, :item_id, :unit_price, :quantity, :created_at, :updated_at)
  end
end
