class Api::V1::InvoiceItems::FindController < ApplicationController
  def show
    if params[:unit_price]
      unit_price = (params[:unit_price].to_f * 100).to_i
      render json: InvoiceItem.find_by(unit_price: unit_price)
    else
      render json: InvoiceItem.where(find_params).first
    end
  end

  def index
    if params[:unit_price]
      unit_price = (params[:unit_price].to_f * 100).to_i
      render json: InvoiceItem.where(unit_price: unit_price)
    else
      render json: InvoiceItem.where(find_params)
    end
  end

  private

  def find_params
    params.permit(:id, :invoice_id, :item_id, :unit_price, :quantity, :created_at, :updated_at)
  end
end
