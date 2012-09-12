class BlankSection < ActiveRecord::Base
  belongs_to :page
  belongs_to :component
  has_many :filled_sections, :dependent => :destroy
end
