class Product < ActiveRecord::Base
  has_and_belongs_to_many :concepts
  has_and_belongs_to_many :dockets
  has_and_belongs_to_many :case_studies
end
