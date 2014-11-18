ActiveAdmin.register ProductConfiguration do
  permit_params :style_color_id, :style_size_id, :cogs, :sku, :product_id, :name, :weight


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


form do |f|
  f.inputs do
    f.input :name
    f.input :style_size
    f.input :style_color
    f.input :cogs
    f.input :sku
    f.input :weight, :label => 'Weight in grams'
    f.input :product
    f.actions
  end

end  


  index do
    column :name   
    column :sku
    column :cogs   
    actions
  end


end
