class ReferenceSet < ActiveRecord::Base
  # This is basically a categorization of examples such that
  # all examples are consistent within a reference set

  belongs_to :super_set
  has_and_belongs_to_many :dockets
  has_many :examples, :dependent => :destroy
  has_many :docuchecks, :dependent => :destroy

  def create_blank_examples
    @components=Component.all
    @components.each do |component|
      @example=Example.new
      @example.reference_set_id=self.id
      @example.component_id=component.id
      @example.is_image=false
      @example.text_content=" "
      @example.save!
    end
  end

end
