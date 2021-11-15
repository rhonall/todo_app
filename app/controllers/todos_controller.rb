class TodosController < ApplicationController
  before_action :get_todos, :get_categories
  before_action :find_todo_item, only: %i[show edit destroy update]
  before_action :categories_for_select, only: %i[new edit]

  def index
    find_today_tasks
  end

  def show; end

  def new
    @todo_item = TodoItem.new
    @categories = Category.select(:id, :name)
  end

  def create
    if params[:todo_item][:category_id] == "new"
      cat = params[:todo_item][:category.name]
      cat = Category.find_by(name: cat[:name]) || Category.create(name: cat[:name])
      @todo_item = TodoItem.new(todo_params)
      @todo_item.category = cat
      @todo_item.save
    else
      @todo_item = TodoItem.create(todo_params)
    end
    redirect_to todos_path, notice: "New todo is added successfully"
  end

  def edit
  end

  def update
    if params[:todo_item][:category_id] == "new"
      cat = params[:todo_item][:category]
      cat = Category.find_by(name: cat[:name]) || Category.create!(name: cat[:name])
      @todo_item.update(todo_params_no_category.merge(category: cat))
    else
      @todo_item.update(todo_params)
    end
    redirect_to todos_path, notice: "Todo is updated successfully"
  end

  def destroy
    @todo_item.destroy
    redirect_to todos_path, notice: "Todo has been deleted successfully"
  end

  private

  def get_todos
    @todos = TodoItem.all
  end

  def find_today_tasks
    @today_tasks = TodoItem.today
  end

  def todo_params
    params.require(:todo_item).permit(:title, :description, :category_id, :due_date)
  end

  def todo_params_no_category
    params.require(:todo_item).permit(:title, :description, :due_date)
  end

  def find_todo_item
    @todo_item = TodoItem.find(params[:id])
  end

  def categories_for_select
    @categories_list = Category.all.collect { |c| [c.name, c.id] }
  end
end
