brew "lua"
brew "luarocks"

node['lua']['rocks'].each do |rock_name, options|
  execute "luarocks install #{rock_name} #{options}" do
    user node['current_user']
  end
end
