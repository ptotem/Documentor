class CreateReferenceSets < ActiveRecord::Migration
  def change
    create_table :reference_sets do |t|
      t.string :name
      t.integer :super_set_id

      t.timestamps
    end
  end
end
