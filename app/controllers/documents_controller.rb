class DocumentsController < ApplicationController
  def index
    @dockets=Docket.all
  end

  def view_documents
    @docket=Docket.find(params[:docket_id])
    @documents=@docket.documents
  end

  def view_document_pages
    @docket=Docket.find(params[:docket_id])
    @document=Document.find(params[:document_id])
    @pages=@document.pages
  end

  def document_customize_view

    @docket=Docket.find(params[:docket_id])
    @document=Document.find(params[:document_id])

    @page=Page.find(params[:page_id])
    @component_types=ComponentType.all
    @blank_sections = @page.blank_sections
    @blank_section=BlankSection.new


  end

  def structure_form


    @blank_section_count=params[:count].to_i

    @page = Page.find(params[:page_id].to_i)
    @existing_blank_sections = @page.blank_sections
    @existing_blank_sections.each do |section|
      section.destroy
    end

    @blank_section_count.times do |i|

      @blank_section = BlankSection.new
      @blank_section.page_id=@page.id
      @component=Component.find_by_name(params[:fields][i][:comp_name])
      @blank_section.component_id=@component.id
      @blank_section.xpos=params[:fields][i][:xpos].to_i
      @blank_section.ypos=params[:fields][i][:ypos].to_i
      @blank_section.height=params[:fields][i][:height].to_i
      @blank_section.width=params[:fields][i][:width].to_i
      @blank_section.save

    end

    render :text => "Ok", :notice => 'Blank Section #{i} was successfully created.'
  end
end
