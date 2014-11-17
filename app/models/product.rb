class Product < ActiveRecord::Base
  has_many :product_configurations
end
