class Page < ActiveRecord::Base
  belongs_to :document
  has_many :blank_sections, :dependent => :destroy
  has_attached_file :sample, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :blank_form, :styles => { :medium => "840x1170>", :thumb => "100x100>" }
end
