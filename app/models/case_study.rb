class CaseStudy < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_and_belongs_to_many :dockets
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :tags
  #has_many :questions,:dependent => :destroy
  has_many :assignments, :dependent => :destroy
end
