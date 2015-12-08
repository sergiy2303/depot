class OrdersController < ApplicationController
  expose(:products) { |default| default.in_cart(cart) }
  def create
    return if cart.include? params[:id]
    cart << params[:id]
  end

  def destroy
    cart.delete(params[:id])
  end
end
