class Admin::ProductsController < ApplicationController
  expose :product
  expose(:products) { |default| default.page(params[:page]).per(10) }

  def create
    if product.update(product_params)
      flash[:success] = 'Product was successfully created'
      redirect_via_turbolinks_to admin_product_path(product.id)
    else
      render :new
    end
  end

  def destroy
    product.destroy
    redirect_via_turbolinks_to admin_products_path
  end

  def update
    product.update(product_params)
    flash[:success] = 'Product was successfully updated'
    redirect_via_turbolinks_to admin_product_path(product.id)
  end

  private

  def product_params
    params[:product].permit!
  end
end
