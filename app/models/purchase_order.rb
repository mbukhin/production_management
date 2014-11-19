class PurchaseOrder < ActiveRecord::Base
  has_many :work_orders
  belongs_to :purchase_order_status



  def cogs_by_product
  	result_set = Hash.new
  	self.work_orders.each { |wo|
  	  result_set[wo.product_configuration.product.name] = 0 if !result_set.has_key?(wo.product_configuration.product.name)  	
  	  result_set[wo.product_configuration.product.name] += wo.product_configuration.cogs if wo.product_configuration.cogs
  	}
  	result_set
  end

  def materials
  	result_set = Hash.new
  	self.work_orders.each { |wo|
  	  wo.product_configuration.required_materials.each { |r|
  	    result_set[r.material] = 0.0 if !result_set.has_key?(r.material)  	
  	    result_set[r.material] += (r.material.unit == 'kilograms' ? (r.amount/1000.0) : r.amount) if r.amount	  
  	  }	
  	}
  	result_set
  end  


end
