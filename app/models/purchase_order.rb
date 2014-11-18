class PurchaseOrder < ActiveRecord::Base
  has_many :work_orders
  has_one  :purchase_order_status
end
