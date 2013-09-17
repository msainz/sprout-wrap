unless /version 1\.7/ =~ `svn --version`
  brew 'homebrew/versions' do
    action :tap
    only_if "brew info subversion17 2>&1 | grep 'No available formula'"
  end
  brew 'subversion17'
end
