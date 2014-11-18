ActiveAdmin.register PurchaseOrder do
  permit_params :name, :purchase_order_status_id


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
    f.input :purchase_order_status
    f.actions
  end

end    

  index do
    column :name
    column :puchase_order_status
    actions
  end

end
