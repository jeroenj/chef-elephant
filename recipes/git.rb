cookbook_file "#{ENV['HOME']}/.gitignore" do
  source 'git/gitignore'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

elephant_recursive_directory "#{ENV['HOME']}/.git-templates/hooks" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

cookbook_file "#{ENV['HOME']}/.git-templates/hooks/pre-commit" do
  source 'git/pre-commit'
  mode 0755
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

cookbook_file "#{ENV['HOME']}/.oh-my-zsh/custom/git.zsh" do
  source 'git/git.zsh'
  only_if { Dir.exist? "#{ENV['HOME']}/.oh-my-zsh/custom" }
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

template "#{ENV['HOME']}/.gitconfig" do
  source 'git/gitconfig.erb'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

include_recipe 'elephant::tig'
