class Api::V1::Items::FindController < ApplicationController

  def index
    render json: Item.where(id: params["id"].to_i) if params["id"]
    render json: Item.where(name: params["name"]) if params["name"]
    render json: Item.where(description: params["description"]) if params["description"]
    render json: Item.where(unit_price: params["unit_price"]) if params["unit_price"]
    render json: Item.where(merchant_id: params["merchant_id"]) if params["merchant_id"]

  end

  def show
    render json: Item.find(params["id"].to_i) if params["id"]
    render json: Item.find_by(name: params["name"]) if params["name"]
    render json: Item.find_by(description: params["description"]) if params["description"]
    render json: Item.find_by(unit_price: params["unit_price"]) if params["unit_price"]
    render json: Item.find_by(merchant_id: params["merchant_id"]) if params["merchant_id"]
    # render json: Item.find_by(created_at: params["created_at"]) if params["created_at"]
  end
end
