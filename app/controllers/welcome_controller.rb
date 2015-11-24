class WelcomeController < ApplicationController
  before_action :require_guest
  expose :categories

  def index
    @session = Session.new
  end

  private

  def products
    products = params[:category] ? category.products : Product.all
    products = products.contain(params[:search][:name]) if params[:search]
    products.page(params[:page]).per(8)
  end
  helper_method :products

  def category
    Category.find(params[:category])
  end
end
