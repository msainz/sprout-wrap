include_recipe "pivotal_workstation::bash_it"
include_recipe "python::virtualenv"

bash_it_path = "#{ENV['HOME']}/.bash_it"
virtualenv_path = "#{ENV['HOME']}/.virtualenv"

directory virtualenv_path do
  owner node['current_user']
  action :create
end

node['python']['virtualenvs'].each do |env_name, interp|
  python_virtualenv "#{virtualenv_path}/#{env_name}" do
    interpreter interp
    owner node['current_user']
    action :create
  end
end


