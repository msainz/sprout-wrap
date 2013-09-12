formula_is_available = (/No available formula/ =~ `brew info subversion17 2>&1`).nil?
unless /version 1\.7/ =~ `svn --version`
  brew 'homebrew/versions' do
    action :tap
    not_if formula_is_available
  end
  brew 'subversion17'
end
