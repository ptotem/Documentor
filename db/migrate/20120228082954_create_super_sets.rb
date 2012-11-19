class CreateSuperSets < ActiveRecord::Migration
  def change
    create_table :super_sets do |t|
      t.string :name

      t.timestamps
    end
  end
end
