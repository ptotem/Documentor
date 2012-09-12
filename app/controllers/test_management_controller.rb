class TestManagementController < ApplicationController

  def landing_page
    @assignments=Assignment.find_all_by_user_id(current_user.id)
    @status=Array.new
    @played_doc=Array.new
    @assignments.each do |assignment|
      if assignment.quiz.played?
        @status[assignment.id]="Quiz Played!!"
      end

      @ref_doc_count=0
      assignment.docuchecks.each do |docu|
        if DocketsDocument.find_by_document_id_and_docket_id(docu.document_id, docu.docket_id).reference_document?
          @ref_doc_count=@ref_doc_count+1
        end
      end

      @played_doc[assignment.id]=assignment.docuchecks.count-@ref_doc_count
      assignment.docuchecks.each do |docu|
        if docu.played? and !DocketsDocument.find_by_document_id_and_docket_id(docu.document_id, docu.docket_id).reference_document?
          @played_doc[assignment.id]=@played_doc[assignment.id]-1
        end
      end

    end

  end

  def play_quiz


    @assignment=Assignment.find(params[:assignment_id])
        redirect_to list_documents_path(:assignment_id => @assignment.id, :docket_id=>@assignment.case_study.dockets.first.id)
    @quiz=@assignment.quiz
    if @quiz 
      if @quiz.played? or @quiz.questions.count==0
      #  redirect_to list_documents_path(:assignment_id => @assignment.id, :docket_id=>Docket.last.id)
      end
      @questions=@quiz.questions
    end
  end

  def save_quiz_data
    @quiz=Quiz.find(params[:quiz_id])
    @assignment=Assignment.find(params[:assignment_id])
    @score=0
    @questions=@quiz.questions
    @questions.each do |question|

      if question.optionacorrect
        @correct_answer=1
      elsif question.optionbcorrect
        @correct_answer=2
      elsif question.optionccorrect
        @correct_answer=3
      else
        @correct_answer=4
      end

      if params["#{question.id}"]==@correct_answer.to_s
        @score=@score+1
      end


    end

    @quiz.score=@score
    @quiz.played=true
    @quiz.save!
    redirect_to list_documents_path(:assignment_id => @assignment.id, :docket_id=>Docket.last.id)
  end

  def list_dockets
    @assignment=Assignment.find(params[:assignment_id])
    @case_study=@assignment.case_study
    @dockets=@case_study.dockets

  end

  def list_documents
    @assignment=Assignment.find(params[:assignment_id])
    @docket=Docket.find(params[:docket_id])
    @docuchecks=@assignment.docuchecks.where(:docket_id=>@docket.id)
    @status=0
    @docuchecks.each do |docu|
      if !docu.played?
        @status=1
        break
      end

    end

    if @status==0
      redirect_to test_landing_page_path
    end

  end


  def play_document_test
    @docucheck=Docucheck.find(params[:docucheck_id])
    @sequence_number=params[:sequence_number]

    @docket=Docket.find(@docucheck.docket_id)
    # @reference_documents=@docket.documents.where(:reference_document=>true)
    #get all reference documents
    @reference_documents=Array.new
    DocketsDocument.find_all_by_docket_id(@docucheck.docket_id).each do |docu|
      if docu.reference_document?
        @reference_documents << Document.find(docu.document_id)

      end
    end

    @document=Document.find(@docucheck.document_id)
    #  @filled_sections=@docucheck.filled_sections

    @pages=@document.pages


    @page=Page.where(:document_id => @docucheck.document_id, :sequence_number => params[:sequence_number].to_i).first

    @blank_sections=@page.blank_sections
    @filled_sections=Array.new
    @blank_sections.each do |blank_section|
      @filled_sections << FilledSection.find_by_blank_section_id_and_docucheck_id(blank_section.id,@docucheck.id)

    end

  end

  def save_document_results


    @docucheck=Docucheck.find(params[:docucheck_id])
    @document=Document.find(@docucheck.document_id)
    @page=Page.where(:document_id => @docucheck.document_id, :sequence_number => params[:sequence_number].to_i).first
    #@filled_sections=@docucheck.filled_sections
    @blank_sections=@page.blank_sections
    @filled_sections=Array.new
    @blank_sections.each do |blank_section|
      @filled_sections << FilledSection.find_by_blank_section_id_and_docucheck_id(blank_section.id,@docucheck.id)

    end

    @filled_sections.each do |filled_section|
      filled_section.answer_marked=params["#{filled_section.id}"]
      filled_section.save!
    end

    @docucheck.played=true
    @docucheck.save!
    @docucheck.calculate_score


    if params[:sequence_number].to_i < @document.pages.count
      redirect_to play_document_test_path(@docucheck.id, (params[:sequence_number].to_i+1))
    else
      redirect_to '/result_landing_page'
    end


  end

  def take_tutorials
    @assignment=Assignment.find(params[:assignment_id])
    @case_study=CaseStudy.find(@assignment.case_study_id)
    @products=@case_study.products
    @concepts=Array.new
    @products.each do |product|
      @concepts=@concepts+product.concepts
    end

  end

  def show_reference_document
    @docket=Docket.find(params[:docket_id])
    #  @docucheck=Docucheck.find_by_docket_id_and_document_id(params[:docket_id], params[:document_id])
    @document=Document.find(params[:document_id])
    @page=@document.pages[params[:page_number].to_i-1]
    #@page=Page.find(params[:page_id])
    @blank_sections=@page.blank_sections
    @filled_sections=Array.new
    @blank_sections.each do |blank_section|
      @filled_sections << FilledSection.find_by_blank_section_id(blank_section.id)

    end

  end

  def start_practice
    @case_study=CaseStudy.find(params[:case_study_id])
    @assignment=Assignment.new
    @assignment.user_id=current_user.id
    @assignment.case_study_id=@case_study.id
    @assignment.practice=true
    @assignment.save!
    redirect_to play_quiz_path(:assignment_id => @assignment.id)
  end

end


