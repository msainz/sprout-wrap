include_recipe "pivotal_workstation::mysql"
node['mysql']['users'].each do |user, password|
  execute "Creating mysql user: #{user}" do
    command <<-EOB
mysql -uroot -p'#{node['mysql_root_password']}' -e \\
"CREATE USER '#{user}'@'localhost' IDENTIFIED BY '#{password}'; \\
GRANT ALL PRIVILEGES ON *.* TO '#{user}'@'localhost'"
    EOB
    only_if { `mysql -uroot -p#{node['mysql_root_password']} -e 'select user from mysql.user' 2> /dev/null | grep #{user}`.empty? }
  end
end
