class CreateCaseStudiesProductsJoinTable < ActiveRecord::Migration
  def change
    create_table :case_studies_products, :id => false do |t|
      t.integer :case_study_id
      t.integer :product_id
    end
  end
end
