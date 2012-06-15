class AddAvatarFileName < ActiveRecord::Migration
  def up
    add_column :slide_images,:avatar_file_name,:string
  end


  def down
  end
end
