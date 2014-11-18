class WorkOrder < ActiveRecord::Base
  belongs_to :worker
  belongs_to :product_configuration
  belongs_to :purchase_order
  belongs_to :work_order_status

  def name
  	if self.purchase_order and self.product_configuration
  	  "#{self.product_configuration.sku} for #{self.purchase_order.name}" 
    else
      "Work Order ##{self.id}"
    end
  end
end
