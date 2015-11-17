class Admin::ProductsController < ApplicationController
  before_action :require_user
  before_action :product, only: [:create, :new]
  before_action :find_product, only: [:destroy, :edit, :update]

  def index
    @products = Product.all
  end

  def new
  end

  def create
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def product
    @product ||= Product.new
  end

  def product_params
    params.require(:product).permit(:name, :description, :image, :price)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  helper_method :product
end
