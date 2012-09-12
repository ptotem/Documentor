class CreatePracticeFilledSections < ActiveRecord::Migration
  def change
    create_table :practice_filled_sections do |t|
      t.integer :filled_section_id
      t.boolean :answer_given

      t.timestamps
    end
  end
end
