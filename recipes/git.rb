%w[gitconfig gitignore githelpers].each do |file|
  template "#{ENV['HOME']}/.#{file}" do
    source "git/#{file}.erb"
    owner node['elephant']['user']
  end
end
