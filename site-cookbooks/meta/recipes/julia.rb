dmg_package "Julia-0.1.2" do
  volumes_dir "Julia"
  source "https://julialang.googlecode.com/files/Julia-0.1.2.dmg"
  checksum "c6e5cf8ba49d3f995821864531a0f31a85bbc31b"
  action :install
  owner node['current_user']
end

