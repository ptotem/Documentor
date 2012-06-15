class CreateFilledSections < ActiveRecord::Migration
  def change
    create_table :filled_sections do |t|
      t.integer :docucheck_id
      t.integer :blank_section_id
      t.integer :example_id
      t.boolean :has_no_error
      t.boolean :marked_correctly

      t.timestamps
    end
  end
end
