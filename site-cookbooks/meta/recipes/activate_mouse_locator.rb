include_recipe "pivotal_workstation::mouse_locator"

execute "Ensure user owns ~/Library/PreferencePanes" do
  command "chown #{node['current_user']} #{ENV['HOME']}/Library/PreferencePanes"
end

execute "Activate Mouse Locator" do
  command "open #{node["mouse_locator_app"]} &"
  user node['current_user']
end

