class CreateCaseStudies < ActiveRecord::Migration
  def change
    create_table :case_studies do |t|
      t.string :name
      t.text :briefing

      t.timestamps
    end
  end
end
