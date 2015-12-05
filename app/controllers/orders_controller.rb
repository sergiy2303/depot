class OrdersController < ApplicationController
  def create
    return if cart.include? params[:id]
    cart << params[:id]
  end

  def destroy
  end
end
