class CreateDocketsReferenceSetsJoinTable < ActiveRecord::Migration
  def change
    create_table :dockets_reference_sets, :id => false do |t|
      t.integer :docket_id
      t.integer :reference_set_id
    end
  end
end
