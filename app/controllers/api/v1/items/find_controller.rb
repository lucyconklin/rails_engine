class Api::V1::Items::FindController < ApplicationController

  def index
    if params[:unit_price]
      unit_price = (params[:unit_price].to_f * 100).to_i
      render json: Item.where(unit_price: unit_price)
    else
      render json: Item.where(find_params)
    end
  end

  def show
    if params[:unit_price]
      unit_price = (params[:unit_price].to_f * 100).to_i
      render json: Item.find_by(unit_price: unit_price)
    else
      render json: Item.where(find_params).first
    end
  end

  private

  def find_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
