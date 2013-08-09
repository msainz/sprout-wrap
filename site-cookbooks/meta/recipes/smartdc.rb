# globally install smartdc (smart data center) using npm
include_recipe "sprout-osx-apps::node_js"
execute "npm install -g smartdc" do
  only_if { `npm list -g | grep smartdc`.empty? }
end

