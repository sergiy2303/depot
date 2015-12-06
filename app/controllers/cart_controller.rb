class CartController < ApplicationController
  def destroy
  end

  def index
    @products = Product.where(id: session[:products].keys) if session[:products]
  end
end
