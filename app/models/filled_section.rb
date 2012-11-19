class FilledSection < ActiveRecord::Base
  belongs_to :docucheck
  belongs_to :blank_section
  belongs_to :example
end

