ActiveAdmin.register Product do
  permit_params :name, :image_url


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

    show do |product|
      attributes_table do
        row :name
        row :image do
          image_tag(product.image_url, size: "100x100")
        end
      end
    end




  index do
    column :name
    column "Image" do |product|
      image_tag product.image_url, size: "100x100"
    end
    actions
  end


end
