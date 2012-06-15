class SlideImage < ActiveRecord::Base
 # attr_accessible :slide_image_file_name

#  attr_accessor :avatar_file_name
  has_attached_file :avatar
end
