class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.integer :concept_id
      t.text :html_block

      t.timestamps
    end
  end
end
