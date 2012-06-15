class AddCommonToComponent < ActiveRecord::Migration
  def change
    add_column :components, :common, :boolean

  end
end
