class AddIsImageToExample < ActiveRecord::Migration
  def change
    add_column :examples, :is_image, :boolean
    add_column :examples, :text_content, :string

  end
end
