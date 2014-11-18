

namespace :pretzel do


 
  desc "bootstrap data"
  task :bootstrap_data => :environment do
    require 'bootstrap_data'
    BootstrapData.run
  end  

 
end

