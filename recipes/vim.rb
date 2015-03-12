package 'vim'

cookbook_file "#{ENV['HOME']}/.vimrc" do
  source 'vim/vimrc'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

git "#{ENV['HOME']}/.vim" do
  repository node[:elephant][:vim][:repository]
  action :sync
  checkout_branch 'master'
  enable_checkout false
  enable_submodules true
  user node[:elephant][:username]
  group node[:elephant][:group]
end
