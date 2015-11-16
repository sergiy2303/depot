class Admin::ProductsController < ApplicationController
  before_action :require_user

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def create
    if product.update(params.require(:product).permit!)
      flash[:success] = 'Product was successfully created'
      redirect_to admin_product_path(product.id)
    else
      render :new
    end
  end

  def destroy
    current_product.destroy
    redirect_via_turbolinks_to admin_products_path
  end

  def update
    current_product.update_attributes(params[:product].permit!)
    flash[:success] = 'Product was successfully updated'
    redirect_to admin_product_path(current_product.id)
  end

  private

  def product
    @product ||= Product.new
  end
  helper_method :product

  def current_product
    @current_product = Product.find_by(id: params[:id])
  end
  helper_method :current_product
end
