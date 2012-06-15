class Example < ActiveRecord::Base
  belongs_to :component
  belongs_to :reference_set
  has_many :filled_sections, :dependent => :destroy

  has_attached_file :example_image, :styles => {:medium => "300x300>", :thumb => "100x100>"}

end
