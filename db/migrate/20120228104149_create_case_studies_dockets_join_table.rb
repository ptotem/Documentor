class CreateCaseStudiesDocketsJoinTable < ActiveRecord::Migration
  def change
      create_table :case_studies_dockets, :id => false do |t|
        t.integer :case_study_id
        t.integer :docket_id
      end
    end
end
