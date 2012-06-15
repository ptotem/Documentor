class Concept < ActiveRecord::Base
  has_and_belongs_to_many :products
  #has_and_belongs_to_many :documents
  has_many :slides, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  has_many :slides,:dependent => :destroy

end
