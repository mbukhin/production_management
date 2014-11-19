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

  show do |po|
    attributes_table do
      row :name

     columns do
       column do
      panel "COGS by Product" do
           ul do
             po.cogs_by_product.each do |k,v|
               li "#{k} - #{v.round(2)} Peruvian Nuevo Sol"
             end
           end
         end
       end

       column do
         panel "Supply for PO" do
           ul do
             po.materials.each do |m,v|
               li "#{m.name}: #{v.round(4)} #{m.unit}"
             end
           end
         end
       end
      end


  end



  end

  index do
    column :name
    column :purchase_order_status
    actions
  end

end
