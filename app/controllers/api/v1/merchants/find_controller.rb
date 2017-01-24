class Api::V1::Merchants::FindController < ApplicationController

  def show
    render json: Merchant.find_by(name: params[:name])
  end
end
