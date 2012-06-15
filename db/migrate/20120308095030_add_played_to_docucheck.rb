class AddPlayedToDocucheck < ActiveRecord::Migration
  def change
    add_column :docuchecks, :played, :boolean ,:default => false


  end
end
