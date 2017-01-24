class Api::V1::Merchants::FindController < ApplicationController

  def show
    # byebug
    render json: Merchant.find_by(find_params)
    # render json: Merchant.find_by("lower(name) LIKE lower(?)", "%#{find_params[:name]}%")
    # render json: Merchant.find_by("lower(name) LIKE lower(?)", "%#{find_params[:name]}%")
    # render json: Merchant.find_by("lower(#{find_params.keys[0]}) LIKE lower(?)", "%#{find_params[find_params.keys[0]]}%")
    # render json: Merchant.find_by("lower(#{find_params}) LIKE lower(?)", "%#{find_params}%")

  end

private

  def find_params
    params.permit(:name, :created_at)
  end
end
