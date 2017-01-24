class Api::V1::Merchants::FindController < ApplicationController

  def show
    render json: Merchant.find_by("lower(name) LIKE lower(?)", "%#{params[:name]}%")
  end
end
