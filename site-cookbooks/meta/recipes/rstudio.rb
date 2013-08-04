dmg_package "RStudio" do
  volumes_dir "RStudio-0.97.551"
  source "http://download1.rstudio.org/RStudio-0.97.551.dmg"
  checksum "896b27e9700d3e8e424c5e3fd5f6a3c3"
  action :install
  owner node['current_user']
end
