class ComponentType < ActiveRecord::Base
  has_many :component_specs,:dependent => :destroy
end
