class CreateSlideImages < ActiveRecord::Migration
  def change
    create_table :slide_images do |t|
      t.string :side_image_file_name

      t.timestamps
    end
  end
end
