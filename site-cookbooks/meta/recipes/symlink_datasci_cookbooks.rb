include_recipe "sprout-osx-base::workspace_directory"
include_recipe "pivotal_workstation::git_projects"

workspace_dir = "#{ENV['HOME']}/#{node['workspace_directory']}"
cookbooks_dir = "#{workspace_dir}/chef-repo/cookbooks"

directory cookbooks_dir do
  user node['current_user']
  action :create
end

node['data_science']['cookbooks'].each do |name|

  link "#{cookbooks_dir}/#{name}" do
    to "#{workspace_dir}/datasci-#{name}-cookbook"
    owner node['current_user']
    action :create
  end

end

