class AddComponentIdToComponentSpec < ActiveRecord::Migration
  def change
    add_column :component_specs, :component_type_id, :integer

  end
end
