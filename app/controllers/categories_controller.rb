class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy set_default]

  def index
    @categories = current_user.categories.order(:name)
  end

  def new
    @category = current_user.categories.build(color: "#6C63FF")
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      update_default_category
      redirect_to categories_path, notice: t("controllers.categories.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      update_default_category
      redirect_to categories_path, notice: t("controllers.categories.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: t("controllers.categories.destroyed")
  end

  def set_default
    if current_user.default_category_id == @category.id
      current_user.update!(default_category_id: nil)
      redirect_to categories_path, notice: t("controllers.categories.default_cleared")
    else
      current_user.update!(default_category_id: @category.id)
      redirect_to categories_path, notice: t("controllers.categories.default_set")
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :color, :icon)
  end

  def update_default_category
    if params[:set_as_default] == "1"
      current_user.update_column(:default_category_id, @category.id)
    elsif current_user.default_category_id == @category.id
      current_user.update_column(:default_category_id, nil)
    end
  end
end
