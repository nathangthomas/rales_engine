class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    render json: MerchantSerializer.new(Customer.find(customer_params[:id]).favorite_merchant)
  #if what I want returned is a merchant it needs to go through the merchant serializer.
  end

  private
  def customer_params
    params.permit(:id, :first_name, :last_name)
  end

end
