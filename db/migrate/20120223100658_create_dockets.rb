class CreateDockets < ActiveRecord::Migration
  def change
    create_table :dockets do |t|
      t.string :name

      t.timestamps
    end
  end
end
