class DropDueDatesTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :due_dates
  end
  
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
