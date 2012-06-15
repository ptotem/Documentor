class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :concept_id
      t.integer :docket_id
      t.text :statement
      t.string :optiona
      t.string :optionb
      t.string :optionc
      t.string :optiond
      t.boolean :optionacorrect
      t.boolean :optionbcorrect
      t.boolean :optionccorrect
      t.boolean :optiondcorrect

      t.timestamps
    end
  end
end
