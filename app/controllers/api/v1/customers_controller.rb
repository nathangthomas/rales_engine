class Api::V1::CustomersController < ApplicationController

  def show
    render json: CustomerSerializer.new(Merchant.find(params[:id]))
  end

end
