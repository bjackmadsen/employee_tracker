class AddDueDateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :due_date, :datetime
  end
end
