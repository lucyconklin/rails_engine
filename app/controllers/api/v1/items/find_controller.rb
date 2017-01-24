class Api::V1::Items::FindController < ApplicationController

  def index
    render json: Item.where(find_params)
  end

  def show
    render json: Item.where(find_params).first
  end

  private

  def find_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
