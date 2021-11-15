class DueDatesController < ApplicationController
  before_action :get_categories, only: [:show]
  def index
  end

  def show
    if params["name"] == "today"
      @title = "Today"
      @due_date_tasks = TodoItem.today
    elsif params["name"] == "tomorrow"
      @title = "Tomorrow"
      @due_date_tasks = TodoItem.tomorrow
    elsif params["name"] == "next7days"
      @title = "Next 7 Days"
      @due_date_tasks = TodoItem.next7days
    end
  end

end
