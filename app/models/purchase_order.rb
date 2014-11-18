class PurchaseOrder < ActiveRecord::Base
  has_many :work_orders
  belongs_to :purchase_order_status
end
