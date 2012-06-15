class CreateComponentSpecs < ActiveRecord::Migration
  def change
    create_table :component_specs do |t|
      t.string :name

      t.timestamps
    end
  end
end
