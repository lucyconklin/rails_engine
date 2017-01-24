class Api::V1::Invoices::FindController < ApplicationController
  def show
    render json: Invoice.where(find_params).first
  end

  private

  def find_params
    params.permit(:id, :merchant_id, :status, :created_at, :updated_at)
  end
end
