class CategoriesController < ApplicationController
  before_action :get_categories, only: [:show, :destroy]
  before_action :find_category, only: [:show, :destroy]
  def index
  end

  def show
  end

  def destroy
    @category.destroy
    redirect_to todos_path, notice: "Category has been deleted successfully"
  end

  private

  def get_categories
    @categories = Category.all
  end

  def find_category
    @category = @categories.find(params[:id])
  end

end
