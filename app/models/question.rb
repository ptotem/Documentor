class Question < ActiveRecord::Base
  belongs_to :concept
  belongs_to :docket
  has_many :quiz_questions, :dependent => :destroy
  has_many :questions,:through => :quiz_questions

end
