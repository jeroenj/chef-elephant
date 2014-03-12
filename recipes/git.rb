%w[gitignore tigrc].each do |name|
  cookbook_file "#{ENV['HOME']}/.#{name}" do
    source "git/#{name}"
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

cookbook_file "#{ENV['HOME']}/.oh-my-zsh/custom/git.zsh" do
  source 'git/git.zsh'
  only_if { Dir.exists? "#{ENV['HOME']}/.oh-my-zsh/custom" }
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

template "#{ENV['HOME']}/.gitconfig" do
  source 'git/gitconfig.erb'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
