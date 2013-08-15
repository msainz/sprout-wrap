include_recipe "pivotal_workstation::bash_it"
%w{nibbler}.each do |theme_name|

  directory "#{ENV['HOME']}/.bash_it/themes/#{theme_name}" do
    owner node['current_user']
    action :create
  end

  cookbook_file "#{ENV['HOME']}/.bash_it/themes/#{theme_name}/#{theme_name}.theme.bash" do
    source "#{theme_name}.theme.bash"
    owner node['current_user']
    mode 0644
  end

end


