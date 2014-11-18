ActiveAdmin.register Worker do
  permit_params :name, :photo_url, :notes, :cell_phone


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

    show do |worker|
      attributes_table do
        row :name
        row :cell_phone
        row :image do
          image_tag(worker.photo_url, size: "100x100")
        end
        panel "Work Orders" do
            ul do
             worker.work_orders.each do |wo|
              columns do
                column do
                  image_tag(wo.product_configuration.product.image_url, size: "100x100")
                end
                column do
                  "#{wo.product_configuration.name} - #{wo.work_order_status.name}"
                end

              end 
             end
           end       
        end  
        row :notes
      end
    end  


  index do
    column :name
    column "Image" do |worker|
      image_tag worker.photo_url, size: "100x100"
    end
    actions
  end  


end
