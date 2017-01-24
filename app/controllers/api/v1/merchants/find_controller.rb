class Api::V1::Merchants::FindController < ApplicationController

  def show
    render json: Merchant.find_by("lower(name) LIKE lower(?)", "%#{find_params[:name]}%")
  end

private

  def find_params
    params.permit(:name)
  end
end
