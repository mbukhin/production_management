class WorkOrderStatusHistory < ActiveRecord::Base
  belongs_to :work_order
end
