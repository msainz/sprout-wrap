filename = "eclipse-jee-kepler-R-macosx-cocoa-x86_64.tar.gz"
filepath = "#{Chef::Config[:file_cache_path]}/#{filename}"

unless File.exists?('/Applications/eclipse/Eclipse.app')

  remote_file filepath do
    source "http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/kepler/R/#{filename}&r=1"
    owner node['current_user']
    checksum "8b5fb40da4f77c0d412eeab75379ab4c86913ee7"
    not_if { File.exists?(filepath) }
  end

  execute "gunzip -c #{filename} | tar xopf -" do
    cwd Chef::Config[:file_cache_path]
    not_if { File.directory?("#{Chef::Config[:file_cache_path]}/eclipse") }
  end

  execute "mv #{Chef::Config[:file_cache_path]}/eclipse /Applications/eclipse"
  execute "chown -R #{node['current_user']} /Applications/eclipse"

  ruby_block "test to see if Eclipse was installed" do
    block do
      raise "Eclipse.app was not installed" unless File.exists?("/Applications/eclipse/Eclipse.app")
    end
  end

  link '/usr/local/bin/eclipse' do
    to '/Applications/eclipse/eclipse'
  end

end







