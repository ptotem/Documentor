class AddDocketIdToDocucheck < ActiveRecord::Migration
  def change
    add_column :docuchecks, :docket_id, :integer

  end
end
