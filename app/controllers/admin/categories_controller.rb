class Admin::CategoriesController < ApplicationController
  before_action :require_user
  before_action :category, only: [:create, :new]
  before_action :find_category, only: [:destroy, :edit, :update]

  def index
    @categories = Category.all
  end

  def new
  end

  def create
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def category
    @category ||= Category.new
  end

  def category_params
    params.require(:category).permit(:category, :description)
  end

  def find_category
    @category = Category.find(params[:id])
  end

  helper_method :category
end
