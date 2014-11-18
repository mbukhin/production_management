ActiveAdmin.register_page "Dashboard" do

  #menu false  

  #menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        image_tag 'http://cdn.shopify.com/s/files/1/0220/8736/t/10/assets/logo.png?1193', width: "150"
      end
    end




  #menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

    
     columns do
       column do
         panel "Material Status" do
           ul do
             Material.all.each do |m|
               li "#{m.name} available: #{number_with_delimiter(m.amount_left, :delimiter => ',') } #{(m.unit == 'kilograms' ? 'grams' : '')}"
             end
           end
         end
       end

       column do
         panel "Work Orders by Status" do
           ul do
             WorkOrderStatus.all.each do |wo|
               li "#{wo.name}: #{wo.work_orders.count}"
             end
           end
         end
       end
     end
  end
end
