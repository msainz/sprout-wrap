
include_recipe "meta::subversion17"

filename = File.join(node['data_bags']['path'], '../.private_data_bags_key')
secret = Chef::EncryptedDataBagItem.load_secret(filename)
glassdoor = Chef::EncryptedDataBagItem.load('private','glassdoor', secret)

parent_dir = glassdoor['jagundi']['parent']
jagundi_dir = "#{parent_dir}/jagundi"

unless File.directory?(jagundi_dir)

  directory jagundi_dir do
    owner node['current_user']
    mode 0755
  end

  execute "svn checkout jagundi" do
    cwd parent_dir
    command <<-CMD.gsub(/^ {4}/,'').chomp
    svn checkout #{glassdoor['jagundi']['svn']['url']} \\
    --username #{glassdoor['jagundi']['svn']['username']} \\
    --password '#{glassdoor['jagundi']['svn']['password']}' \\
    --non-interactive
    CMD
    user node['current_user']
  end

end

directory "#{jagundi_dir}/temp-upload" do
  owner node['current_user']
  mode 0755
end

# TODO: include bash_it recipe
# TODO: create .bash_it_ignore file if property set
# TODO: be able to checkout only a certain portion of the repo (use subversion provider)


