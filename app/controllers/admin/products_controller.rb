class Admin::ProductsController < ApplicationController
  before_action :require_user

  def index
    @products = Product.page(params[:page]).per(10)
  end
end
