class TodoItem < ApplicationRecord
  belongs_to :category

  scope :get_todos, -> { select(:title, :id) }

  scope :today, -> { get_todos.where(due_date: DateTime.now) }
  scope :tomorrow, -> (date = DateTime.now, date2 = DateTime.now+2) { get_todos.where('due_date > ?', date).and(get_todos.where('due_date < ?', date2)) }
  scope :next7days, -> (date = DateTime.now+1, date7 = DateTime.now+8) { get_todos.where('due_date > ?', date).and(get_todos.where('due_date < ?', date7)) }
end
