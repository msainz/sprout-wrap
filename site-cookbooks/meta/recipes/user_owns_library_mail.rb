execute "your current user owns /User/<current_user>/Library/Mail" do
  dir = "/Users/#{node['current_user']}/Library/Mail"
  command "chown -R #{node['current_user']} #{dir}"
  only_if { ::File.directory?(dir) }
end
