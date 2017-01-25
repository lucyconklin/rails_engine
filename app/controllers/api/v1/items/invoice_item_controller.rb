class Api::V1::Items::InvoiceItemController < ApplicationController

  def index
    render json: InvoiceItem.where(item_id: params[:id]) #, serializer: ItemsInvoiceItemSerializer
  end
end
