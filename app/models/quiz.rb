class Quiz < ActiveRecord::Base
  belongs_to :assignment
  has_many :quiz_questions, :dependent => :destroy
  has_many :questions,:through => :quiz_questions
end
