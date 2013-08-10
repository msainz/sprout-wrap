include_recipe "pivotal_workstation::bash_it"
cookbook_file "/Users/#{node['current_user']}/.bash_it/aliases/custom.aliases.bash" do
  source 'custom.aliases.bash'
  owner node['current_user']
  mode 0644
end
