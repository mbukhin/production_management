ActiveAdmin.register RequiredMaterial do
  permit_params :name, :product_configuration_id, :amount, :material_id, :units


form do |f|
  f.inputs do
    f.input :name
    f.input :product_configuration
    f.input :material
    f.input :amount
    f.input :units, :label => 'Units', :as => :select, :collection => Rails.application.config.material_units

    f.actions
  end

end  



  index do
    column :name
    column :product_configuration
    column :material
    column :amount
    column :units
    actions
  end

end
