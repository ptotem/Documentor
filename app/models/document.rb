class Document < ActiveRecord::Base

  has_and_belongs_to_many :case_studies
  #has_and_belongs_to_many :concepts
  has_many :pages, :dependent => :destroy ,:order => :sequence_number
  has_many :docuchecks, :dependent => :destroy

  #has_many :filled_sections,:dependent => :destroy
  has_many :dockets_documents,:dependent => :destroy
  has_many :dockets,:through => :dockets_documents



end
