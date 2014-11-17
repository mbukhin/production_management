class RequiredMaterial < ActiveRecord::Base
  belongs_to :product_configuration
  belongs_to :material
end
