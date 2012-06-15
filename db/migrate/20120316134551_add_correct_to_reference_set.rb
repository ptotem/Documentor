class AddCorrectToReferenceSet < ActiveRecord::Migration
  def change
    add_column :reference_sets, :correct, :boolean

  end
end
