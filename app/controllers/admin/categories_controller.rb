class Admin::CategoriesController < ApplicationController
  before_action :require_user

  def index
    @categories = Category.page(params[:page]).per(10)
  end

  def create
    return unless category.update(params.require(:category).permit!)
    flash[:success] = 'Category was successfully created'
    redirect_to admin_categories_path
  end

  def update
    current_category.update_attributes(params[:category].permit!)
    flash[:success] = 'Category was successfully updated'
    redirect_to admin_categories_path
  end

  def destroy
    current_category.destroy
    redirect_via_turbolinks_to admin_categories_path
  end

  private

  def category
    @category ||= Category.new
  end
  helper_method :category

  def current_category
    @current_category ||= Category.find_by(id: params[:id])
  end
  helper_method :current_category
end
