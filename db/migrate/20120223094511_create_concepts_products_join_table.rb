class CreateConceptsProductsJoinTable < ActiveRecord::Migration
  def change
    create_table :concepts_products, :id => false do |t|
      t.integer :concept_id
      t.integer :product_id
    end
  end
end
