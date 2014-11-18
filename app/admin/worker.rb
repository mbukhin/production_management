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
        row :notes
      end
    end  


  index do
    column :name
    column "Image" do |worker|
      image_tag worker.photo_url, class: 'my_image_size'
    end
    actions
  end  


end
