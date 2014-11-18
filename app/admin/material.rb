ActiveAdmin.register Material do
  permit_params :name, :unit, :internal_name


form do |f|
  f.inputs do
    f.input :name
    f.input :internal_name
    f.input :unit, :label => 'Units', :as => :select, :collection => Rails.application.config.material_units
    f.actions
  end

end  


  index do
    column :name
    column :unit
    column :internal_name
    actions
  end

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


end
