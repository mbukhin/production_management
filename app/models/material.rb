class Material < ActiveRecord::Base
  has_many :required_materials
  has_many :material_changes



  def amount_left
  	total = 0.0
  	self.material_changes.each { |s|
  		total += (s.units == 'kilograms' ? s.amount * 1000.0 : s.amount)
  	}

  	entered_status = WorkOrderStatus.find_by_name('Entered')
  	self.required_materials.all.each { |rm|
  		rm.product_configuration.work_orders.each { |wo|
  			if wo.work_order_status != entered_status
  				total = (total - (rm.units == 'kilograms' ? rm.amount * 1000.0 : rm.amount))
  			end


  		}


  	}




  	total.round

  end



end
