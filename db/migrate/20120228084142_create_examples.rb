class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.integer :component_id
      t.integer :reference_set_id
      t.string :example_image_file_name

      t.timestamps
    end
  end
end
