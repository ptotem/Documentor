class AddPlayedToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :played, :boolean,:default => false

  end
end
