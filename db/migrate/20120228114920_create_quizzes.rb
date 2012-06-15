class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :assignment_id
      t.integer :qcount
      t.integer :score

      t.timestamps
    end
  end
end
