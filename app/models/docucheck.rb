class Docucheck < ActiveRecord::Base
  belongs_to :document
  belongs_to :assignment
  belongs_to :reference_set
  has_many :filled_sections, :dependent => :destroy

  after_save :create_filled_section

  def create_filled_section

    if self.filled_sections.count==0
      @document=Document.find(self.document_id)
      @assignment=Assignment.find(self.assignment_id)
      @case_study=CaseStudy.find(@assignment.case_study_id)


      @pages=@document.pages
      @blank_sections=Array.new
      @pages.each do |page|
        @blank_sections=@blank_sections+page.blank_sections
      end


      @blank_sections.each do |blank_section|
        @filled_section=FilledSection.new
        @filled_section.docucheck_id=self.id
        @filled_section.blank_section_id=blank_section.id
        @component=Component.find(blank_section.component_id)

        #if the document is a reference document,everything should be correct
        if DocketsDocument.find_by_docket_id_and_document_id(self.docket_id, self.document_id).reference_document?
          @reference_set=ReferenceSet.find(self.reference_set_id)
          @filled_section.has_no_error=true
        else

          #decide what reference set to use
          if rand < 0.75
            @reference_set=ReferenceSet.find(self.reference_set_id)
          else
            @reference_set=ReferenceSet.find((SuperSet.find(Docket.find(self.docket_id).super_set_id).reference_sets.where('id<>?', ReferenceSet.find(self.reference_set_id)).shuffle.first.id))
          end
          end

        if !@reference_set.correct? or @reference_set.id!=self.reference_set_id
          @filled_section.has_no_error=false
        else
          @filled_section.has_no_error=true
        end

        @example=Example.find_by_reference_set_id_and_component_id(@reference_set.id, @component.id)
        if @example.nil?
          @example=Example.find_by_reference_set_id_and_component_id(SuperSet.find(Docket.find(self.docket_id).super_set_id).reference_sets.where(:name => "blank_set").first.id, @component.id)
          @filled_section.has_no_error=false
        end
        @filled_section.example_id=@example.id

        ####common component code###
        if @component.common?
          if !@reference_set.correct?
            @filled_section.has_no_error=false
          else

          end
        end

        @filled_section.save!

      end
    end
  end

  def calculate_score

    @score=0
    self.filled_sections.each do |filled_section|
      if filled_section.has_no_error==filled_section.answer_marked
        @score=@score+1
      end
    end

    self.score=@score
    self.save!
  end
end
