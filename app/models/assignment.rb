class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :case_study
  has_many :docuchecks, :dependent => :destroy
  has_one :quiz, :dependent => :destroy

  after_save :create_quiz, :create_documents

  def create_quiz
    @case_study=CaseStudy.find(self.case_study_id)
    @products=@case_study.products
    @concepts=Array.new
    @products.each do |product|
      @concepts =@concepts+ product.concepts
    end
    @questions=Array.new
    #@concepts.each_with_index do |concept, index|
    #  @questions =@questions+ concept.questions
    #end
    @case_study.dockets.each do |docket|
      @questions=@questions+docket.questions
    end

    @quiz=Quiz.new
    @quiz.assignment_id=self.id
    @quiz.qcount=@questions.count
    @quiz.score=0
    @quiz.save!
    @questions.each do |question|
      @quiz_question=QuizQuestion.new
      @quiz_question.quiz_id=@quiz.id
      @quiz_question.question_id=question.id
      @quiz_question.save!

    end
  end

  def create_documents
    @case_study=CaseStudy.find(self.case_study_id)
    @dockets=@case_study.dockets

    #@documents=@case_study.documents
    @dockets.each do |docket|
      @reference_sets=SuperSet.find(docket.super_set_id).reference_sets
      if !@reference_sets.where(:correct => true).blank?
        @final_reference_set=@reference_sets.where(:correct => true).shuffle.first.id
      else
        @final_reference_set=@reference_sets.first.id

      end
      docket.documents.each do |document|
        @docucheck=Docucheck.new
        @docucheck.assignment_id=self.id
        @docucheck.document_id=document.id
        @docucheck.docket_id=docket.id
        @docucheck.reference_set_id=@final_reference_set
        @docucheck.score=0
        @docucheck.save!
      end
    end


  end


end
