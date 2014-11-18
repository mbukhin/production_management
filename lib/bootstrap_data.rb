class BootstrapData





  
  def self.run

  	session = GoogleDrive.login("anna@misha-and-puff.com", "b@bynadav")
	spreadsheet = session.spreadsheet_by_key("1CgjAsxIM_zy_t9VVHeOYp_HUvRQHDokM_v7sHRllj5s")
	ws = spreadsheet.worksheets[1]

	# first create the products and their images
	Product.destroy_all
	
	product_sku_translation = Hash.new
	for row in 2..ws.num_rows
		if ws[row, 2].length > 0
		  p = Product.create(name: ws[row,2], image_url: ws[row,25])
		  product_sku_translation[ws[row,14][0..6]] = p.id
  		end
  	end

  	# next, grab the statuses
  	PurchaseOrderStatus.destroy_all
  	WorkOrderStatus.destroy_all
  	ws = spreadsheet.worksheets[2]
	for row in 2..ws.num_rows
	  WorkOrderStatus.where(name: ws[row,1]).first_or_create
	  PurchaseOrderStatus.where(name: ws[row,2]).first_or_create
	end

  	# next, create the product configurations
  	ProductConfiguration.destroy_all
  	StyleSize.destroy_all
  	StyleColor.destroy_all

  	ws = spreadsheet.worksheets[0]
	for row in 2..ws.num_rows
	  sku = ws[row,2]
	  short_sku = sku[0..6]
	  name = ws[row,3]
	  cogs = ws[row,5]
	  product_id = product_sku_translation[short_sku]

	  # this is ugly but it is just breaking apart "Baby Bloomers (Butter, 12-18 m)"
	  if name.match(",")
	    tmp = name.split(" (")[1].split(", ")
	    color = tmp[0]	
	    size = tmp[1][0..-2]
	  else
	  	# if no comma that means it looks like this, color not size '"Heirloom Baby Blanket (Blush)"'
	  	tmp = name.split('(')
	  	size = 'One Size'
	  	color = tmp[1][0..-2]
	  end
	  color = StyleColor.where(name: color).first_or_create
	  size = StyleSize.where(name: size).first_or_create

  	  pc = ProductConfiguration.new
  	  pc.product_id = product_id
  	  pc.name = name
  	  pc.cogs = cogs
  	  pc.sku = sku
  	  pc.style_color_id = color.id
  	  pc.style_size_id = size.id
  	  # only save stuff we find in shopify.  this gets rid of spring and other noise
  	  # long term this will be a problem but we use shopify for images
  	  pc.save if product_id
  	end


  	# ok time for materials
  	Material.destroy_all
  	RequiredMaterial.destroy_all
  	MaterialChange.destroy_all

  	ws = spreadsheet.worksheets[3]
	for row in 2..ws.num_rows
	  m = Material.where(name: ws[row,1]).first_or_create	 
	  m.unit = ws[row,2]
	  m.sku_abbreviation = ws[row,3]
	  m.save

	  mc = MaterialChange.new
	  mc.name = 'Added ' + ws[row,1]
	  mc.amount = ws[row,4]
	  mc.units = ws[row,2]
	  mc.material = m
	  mc.disable = false
	  mc.save
    end

    # FAKE FAKE FAKE
    # --------------
    # This is for the material to product configuration mapping as well as COGS.  Fuck it for now, need to talk to Didi

    ProductConfiguration.all.each { |pc|

    	# assign basic colors
    	sku_color = pc.sku.split('-')[1]
    	colors = []
    	m = Material.find_by_sku_abbreviation(sku_color)
    	colors << m if m
    	# ok maybe it's a triple color
    	case sku
		  when "NPB"
		  	colors = [ Material.fnd_by_sku_abbreviation("NUT"), Material.fnd_by_sku_abbreviation("PER"), Material.fnd_by_sku_abbreviation("BLU") ]
		  when "NBZ"
		  	colors = [ Material.fnd_by_sku_abbreviation("NUT"), Material.fnd_by_sku_abbreviation("ZEP"), Material.fnd_by_sku_abbreviation("BLU") ]
		  when "ZGN"
		  	colors = [ Material.fnd_by_sku_abbreviation("NUT"), Material.fnd_by_sku_abbreviation("ZEP"), Material.fnd_by_sku_abbreviation("GRA") ]
		end

    	if colors.length > 0
    	  colors.each { |c|	
    	    amount = (rand * (2) + 1).round(2)
    	    rq = RequiredMaterial.new
    	    rq.name = m.name
    	    rq.product_configuration = pc
    	    rq.amount = amount
    	    rq.units = 'grams'
    	    rq.material = m 
    	    rq.save
    	  }
    	end


    	# add some buttons
    	button_records = Material.where(unit: 'count')
    	m= button_records.offset(rand(button_records.count)).first
    	rq = RequiredMaterial.new
    	rq.name = m.name
    	rq.product_configuration = pc
    	rq.amount = rand(4)
    	rq.units = 'count'
    	rq.material = m 
    	rq.save

    }



    # ---------------
    # FAKE FAKE FAKE



    # Workers
    Worker.destroy_all
    ws = spreadsheet.worksheets[5]
	for row in 2..ws.num_rows
	  w = Worker.new
	  w.name = ws[row,1]
	  w.cell_phone = ws[row,2]
	  w.photo_url = ws[row,3]
	  w.save	
	end


	# dummy po
	PurchaseOrder.destroy_all
	po = PurchaseOrder.create(name: 'F/W15 PO', purchase_order_status_id: PurchaseOrderStatus.first.id)
    ws = spreadsheet.worksheets[6]
	for row in 2..ws.num_rows
	    if pc = ProductConfiguration.find_by_sku(ws[row,1])
	      w = WorkOrder.new
	      w.work_order_status_id = WorkOrderStatus.find_by_name('Entered').id
	      w.product_configuration_id = pc.id
	      w.purchase_order_id = po.id
          w.save	
		else
	      puts ws[row,1]
	    end
	end

  	puts product_sku_translation


  
  

  end



end

