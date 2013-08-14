file '/usr/local/bin/lock' do
  owner node['current_user']
  mode 0755
  content <<-EOB
#!/usr/bin/env bash
/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -suspend
EOB
  not_if { ::File.exist? '/usr/local/bin/lock' }
end
