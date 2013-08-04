dmg_package "JuliaStudio" do
  volumes_dir "julia-studio-macx-installer-0.3.2"
  source "http://forio.com/julia/downloads/julia-studio-macx-installer-0.3.2.dmg"
  checksum "246e5d8fe237b6ca698568142273385fdebf22d60d85701da4400be7bc6d55e5"
  action :install
  owner node['current_user']
end
