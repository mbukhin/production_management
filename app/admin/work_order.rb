ActiveAdmin.register WorkOrder do
  permit_params :work_order_status_id, :worker_id, :product_configuration_id, :purchase_order_id


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
    f.input :worker
    f.input :product_configuration
    f.input :purchase_order
    f.input :work_order_status
    f.actions
  end

end    

  index do
    column :purchase_order
    column :product_configuration
    column :worker
    column :work_order_status

    actions
  end


end
