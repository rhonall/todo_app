class RemoveDueDateFromTodoItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :todo_items, :due_date_id, :reference
  end
end



