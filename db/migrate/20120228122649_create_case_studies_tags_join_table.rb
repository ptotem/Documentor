class CreateCaseStudiesTagsJoinTable < ActiveRecord::Migration
  def change
    create_table :case_studies_tags, :id => false do |t|
      t.integer :case_study_id
      t.integer :tag_id
    end
  end
end
