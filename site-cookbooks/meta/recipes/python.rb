include_recipe "pivotal_workstation::bash_it"
include_recipe "python::virtualenv"

bash_it_path = "/Users/#{node['current_user']}/.bash_it"
virtualenv_path = "/Users/#{node['current_user']}/.virtualenv"

directory virtualenv_path do
  owner node['current_user']
  action :create
end

%w{default}.each do |env|
  python_virtualenv "#{virtualenv_path}/#{env}" do
    interpreter 'python2.7'
    owner node['current_user']
    action :create
  end
end


