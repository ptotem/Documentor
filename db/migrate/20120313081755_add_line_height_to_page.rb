class AddLineHeightToPage < ActiveRecord::Migration
  def change
    add_column :pages, :line_height, :integer

  end
end
