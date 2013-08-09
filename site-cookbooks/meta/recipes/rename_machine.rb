# The scutil commands need to run as root, unless
# you're logged into the console, but we can't be sure of that.
oldname = `scutil --get ComputerName`.chop
name = (node['machine']['name'] rescue nil) || oldname
if name != oldname
  log "Renaming machine #{oldname} -> #{name}"
  ["scutil --set ComputerName #{name}",
   "scutil --set LocalHostName #{name}",
   "scutil --set HostName #{name}",
   "hostname #{name}",
   "diskutil rename / #{name}" ].each do |host_cmd|
    execute host_cmd
  end

  ruby_block "test to see if hostname was set" do
    block do
      raise "Setting of hostname failed" unless name == `scutil --get ComputerName`.chop
    end
  end
end
