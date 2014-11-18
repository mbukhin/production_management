class WorkOrder < ActiveRecord::Base
  belongs_to :worker
  belongs_to :product_configuration
  belongs_to :purchase_order
  has_one 	 :work_order_status
end
