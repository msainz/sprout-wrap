filename = File.join(node['data_bags']['path'], '../.private_data_bags_key')
secret = Chef::EncryptedDataBagItem.load_secret(filename)
gd = Chef::EncryptedDataBagItem.load('private','glassdoor', secret)

buffer = ""
gd['environment']['variables'].each do |varname, value|
  buffer << "#{varname}=#{value}; export #{varname}\n"
end

filename = "#{ENV['HOME']}/.bash_it/custom/glassdoor_environment.bash"
file filename do
  mode "700"
  user node['current_user']
  action :create
  content buffer
  not_if { File.exist?(filename) }
end




