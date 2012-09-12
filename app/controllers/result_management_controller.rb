class ResultManagementController < ApplicationController

  def landing_page
    @assignments=Assignment.find_all_by_user_id(current_user.id)
    @doc_score=Array.new
    @assignments.each do |assignment|
      @doc_score[assignment.id]=0
      @docuchecks=assignment.docuchecks
      @docuchecks.each do |docu|
        @doc_score[assignment.id]=@doc_score[assignment.id]||=0+docu.score
        #   @doc_score[assignment.id]=0
      end
    end

  end

  def show_docket_list
    @case_study=CaseStudy.find(params[:case_study_id])
    @assignment=Assignment.find(params[:assignment_id])
    @dockets=@case_study.dockets

  end

  def show_document_list
    @assignment=Assignment.find(params[:assignment_id])
    @case_study=CaseStudy.find(params[:case_study_id])
    @docket=Docket.find(params[:docket_id])
    @documents=@docket.documents
  end

  def  show_page_list
    @case_study=CaseStudy.find(params[:case_study_id])
    @docket=Docket.find(params[:docket_id])
    @document=Document.find(params[:document_id])
    @pages=@document.pages
  end
  def show_corrected_page
    @assignment=Assignment.find(params[:assignment_id])
    @case_study=CaseStudy.find(@assignment.case_study_id)
    @docket=Docket.find(params[:docket_id])
    @docucheck=Docucheck.find(params[:docucheck_id])
    @document=Document.find(@docucheck.document_id)
    @pages=@document.pages

    @page=Page.find(params[:page_id])
    @blank_sections=@page.blank_sections
    @filled_sections=Array.new
    @blank_sections.each do |blank_section|
      @filled_sections << FilledSection.find_by_blank_section_id_and_docucheck_id(blank_section.id,@docucheck.id)

    end
  end
end
