class CreateDocketsProductsJoinTable < ActiveRecord::Migration
  def change
      create_table :dockets_products, :id => false do |t|
        t.integer :docket_id
        t.integer :product_id
      end
    end
end
