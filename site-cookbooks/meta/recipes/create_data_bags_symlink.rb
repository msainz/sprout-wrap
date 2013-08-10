# until soloistrc support a data_bags_paths property, run
# this recipe before all others, in a separate run
include_recipe "pivotal_workstation::create_var_chef_cache"
include_recipe "sprout-osx-base::workspace_directory"

Chef::Log.info "data_bags path: #{node['data_bags']['path']}"
link '/var/chef/data_bags' do
  to node['data_bags']['path']
  owner 'root'
  action :create
end
