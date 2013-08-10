include_attribute "sprout-osx-base::workspace_directory"
node.default['data_bags'] = {
  'path' => "/Users/#{node['current_user']}/#{node['workspace_directory']}/sprout-wrap/data_bags"
}

