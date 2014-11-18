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
	  PurchaseOrderStatus.where(name: ws[row,1]).first_or_create
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


    # ---------------
    # FAKE FAKE FAKE


  	puts product_sku_translation


  
  

  end



end

