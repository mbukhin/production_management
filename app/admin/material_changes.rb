ActiveAdmin.register MaterialChange do
  permit_params :name, :amount, :notes, :material_id, :disable, :units


form do |f|
  f.inputs do
    f.input :name, :label => 'Description'
    f.input :amount
    f.input :units, :label => 'Units', :as => :select, :collection => Rails.application.config.material_units
    f.input :material
    f.input :disable
    f.actions
  end

end 

  index do
    column :name
    column :material
    column :amount
    column :units
    column :disable, :name => 'Disabled'
    actions
  end

end
