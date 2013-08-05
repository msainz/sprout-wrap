# globally install jsontool using npm
include_recipe "sprout-osx-apps::node_js"
execute "npm install -g jsontool" do
  only_if { `npm list -g | grep jsontool`.empty? }
end