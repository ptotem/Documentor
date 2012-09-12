class CreateBlankSections < ActiveRecord::Migration
  def change
    create_table :blank_sections do |t|
      t.integer :page_id
      t.integer :component_id
      t.integer :xpos
      t.integer :ypos
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
