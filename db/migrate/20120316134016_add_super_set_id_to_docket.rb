class AddSuperSetIdToDocket < ActiveRecord::Migration
  def change
    add_column :dockets, :super_set_id, :integer


  end
end
