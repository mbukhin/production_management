class ProductConfiguration < ActiveRecord::Base
  belongs_to :product
  has_many :required_materials
end
