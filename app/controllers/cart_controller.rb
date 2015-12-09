class CartController < ApplicationController
  def destroy
  end

  def index
    @products = Product.where(id: session[:products].keys) if session[:products]
  end

  private

  def cart_empty?
    !@products || !session[:products]
  end
end
