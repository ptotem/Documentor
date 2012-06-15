class PracticeManagementController < ApplicationController
  def landing_page
    @case_studies=CaseStudy.all

  end

  def list_practice_details
    @case_study=CaseStudy.find(params[:case_study_id])
    @assignments=@case_study.assignments
    @status=Array.new
    @played_doc=Array.new
    @assignments.each do |assignment|
      if assignment.quiz and assignment.quiz.played?
        @status[assignment.id]="Quiz Played!!"
      end

      @ref_doc_count=0
      assignment.docuchecks.each do |docu|
        if DocketsDocument.find_by_document_id_and_docket_id(docu.document_id,docu.docket_id).reference_document?
          @ref_doc_count=@ref_doc_count+1
        end
      end

      @played_doc[assignment.id]=assignment.docuchecks.count-@ref_doc_count
      assignment.docuchecks.each do |docu|
        if docu.played?
          @played_doc[assignment.id]=@played_doc[assignment.id]-1
        end
      end

    end



  end

  def practice_document

    @docucheck=Docucheck.find(params[:docucheck_id])
    @document=Document.find(@docucheck.document_id)
    @filled_sections=@docucheck.filled_sections

    @pages=@document.pages
    if params[:sequence_number]
      @current_page=params[:sequence_number].to_i
    else
      @current_page=0
    end
    @page=@pages[@current_page]


  end

  def save_practice_document_results

    @docucheck=Docucheck.find(params[:docucheck_id])
    @document=Document.find(@docucheck.document_id)

    @filled_sections=@docucheck.filled_sections

    @filled_sections.each do |filled_section|
      @practice_filled_section=PracticeFilledSection.new
      @practice_filled_section.filled_section_id=filled_section.id
      @practice_filled_section.answer_given=params["#{filled_section.id}"]
      @practice_filled_section.save!
    end

    if params[:current_page].to_i < @document.pages.count-1
      redirect_to practice_document_path(:docucheck_id => @docucheck.id, :sequence_number => params[:current_page].to_i+1)
    else
      redirect_to list_practice_documents_path(:assignment_id => @docucheck.assignment_id)
    end

  end

end
