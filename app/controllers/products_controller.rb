class ProductsController < ApplicationController

  def index
    @session = Session.new
    if params[:id]
      @products = products.where(category_id: params[:id])
    else
      @products = products
    end
    flash.now[:notice] = 'No products for this category' if @products.empty?
  end

  def search
    if params[:search].present?
      @products = Product.page(params[:page]).per(9).search(params[:search]).records
    else
      @products = products
    end
    render partial: 'products'
  end

  private

  def products
    @products = Product.page(params[:page]).per(9)
  end

  def product
    @product ||= Product.new
  end
  helper_method :product

  def current_product
    @product = Product.find_by(id: params[:id])
  end
  helper_method :current_product

  def categories
    @categories = Category.all
  end
  helper_method :categories
end
