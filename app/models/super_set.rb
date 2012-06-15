class SuperSet < ActiveRecord::Base

  # This is basically a categorization of reference sets such that
  # you can pick examples from within the super sets and there would be
  # examples populated for all components in all cases and it would make sense
  # if an example is picked from any reference set within the super set
  # in the context of documents created


  has_many :reference_sets, :dependent => :destroy
has_many :dockets
  after_create :create_blank_reference_set
  def create_blank_reference_set
    @reference_set=ReferenceSet.new
    @reference_set.name="blank_set"
    @reference_set.super_set_id=self.id
    @reference_set.save!
    @reference_set.create_blank_examples

  end
end
