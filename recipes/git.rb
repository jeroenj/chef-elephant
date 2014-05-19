cookbook_file "#{ENV['HOME']}/.gitignore" do
  source 'git/gitignore'
  owner node[:elephant][:username]
  group node[:elephant][:group]
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
