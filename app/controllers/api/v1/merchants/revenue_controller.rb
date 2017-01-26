class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    if params[:date]
      render json: Merchant.find(params[:id]).date_total_revenue(params[:date]),
      serializer: SingleMerchantSerializer
    else
     render json: Merchant.find(params[:id]).total_revenue,
     serializer: SingleMerchantSerializer
   end
  end

  def index
    render json: Merchant.total_revenue(params[:date]),
    serializer: AllMerchantsSerializer
  end
end
