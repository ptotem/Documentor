class AddQuizIdToCaseStudy < ActiveRecord::Migration
  def change
    add_column :case_studies, :quiz_id, :integer

  end
end
