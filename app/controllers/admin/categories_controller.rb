class Admin::CategoriesController < AdminController
  before_action :require_user
  expose :category
  expose(:categories) { |default| default.page(params[:page]).per(10) }

  def create
    if category.update(category_params)
      flash[:success] = 'Category was successfully created'
      redirect_via_turbolinks_to admin_categories_path
    else
      render :new
    end
  end

  def update
    category.update(category_params)
    flash[:success] = 'Category was successfully updated'
    redirect_via_turbolinks_to admin_categories_path
  end

  def destroy
    category.destroy
    redirect_via_turbolinks_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit!
  end
end
