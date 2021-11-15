class ApplicationController < ActionController::Base
  def get_categories
    @categories = Category.select(:name, :id).all
  end
end
