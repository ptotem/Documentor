class AddSequenceNumberToPage < ActiveRecord::Migration
  def change
    add_column :pages, :sequence_number, :integer

  end
end
