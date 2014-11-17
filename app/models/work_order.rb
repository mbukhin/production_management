class WorkOrder < ActiveRecord::Base
  belongs_to :worker
  belongs_to :product_configuration
  belongs_to :purchase_order
end
