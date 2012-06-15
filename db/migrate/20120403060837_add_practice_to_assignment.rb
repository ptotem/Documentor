class AddPracticeToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :practice, :boolean

  end
end
