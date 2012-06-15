class CreateQuizQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_questions do |t|
      t.integer :quiz_id
      t.integer :question_id
      t.boolean :optiona
      t.boolean :optionb
      t.boolean :optionc
      t.boolean :optiond
      t.boolean :marked_correctly

      t.timestamps
    end
  end
end
