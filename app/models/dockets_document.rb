class DocketsDocument < ActiveRecord::Base
  set_table_name :dockets_documents


  belongs_to :document
  belongs_to :docket
end
