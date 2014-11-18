class Material < ActiveRecord::Base
  has_many :required_materials
  has_many :material_changes
end
