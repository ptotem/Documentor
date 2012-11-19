class CreateDocketsDocumentsJoinTable < ActiveRecord::Migration
  def change
    create_table :dockets_documents do |t|
      t.integer :docket_id
      t.integer :document_id
      t.boolean :reference_document,:default => false
    end
  end
end
