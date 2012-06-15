class CreateDocuchecks < ActiveRecord::Migration
  def change
    create_table :docuchecks do |t|
      t.integer :assignment_id
      t.integer :document_id
      t.integer :reference_set_id
      t.integer :score

      t.timestamps
    end
  end
end
