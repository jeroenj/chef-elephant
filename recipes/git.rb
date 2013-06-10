%w[gitconfig githelpers].each do |file|
  template "#{ENV['HOME']}/.#{file}" do
    source "git/#{file}.erb"
  end
end

cookbook_file "#{ENV['HOME']}/.gitignore" do
  source 'git/gitignore'
end
