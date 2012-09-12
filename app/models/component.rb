class Component < ActiveRecord::Base
  has_many :examples, :dependent => :destroy
  has_many :blank_sections, :dependent => :destroy
end
