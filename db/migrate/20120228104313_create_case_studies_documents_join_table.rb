class CreateCaseStudiesDocumentsJoinTable < ActiveRecord::Migration
  def change
      create_table :case_studies_documents, :id => false do |t|
        t.integer :case_study_id
        t.integer :document_id
      end
    end
end
