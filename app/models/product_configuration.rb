class ProductConfiguration < ActiveRecord::Base
  belongs_to :product
  has_many :required_materials
  belongs_to :style_color
  belongs_to :style_size
end
