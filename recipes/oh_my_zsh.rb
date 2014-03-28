git "#{ENV['HOME']}/.oh-my-zsh" do
  repository 'https://github.com/robbyrussell/oh-my-zsh.git'
  action :sync
  user node[:elephant][:username]
  group node[:elephant][:group]
end

cookbook_file "#{ENV['HOME']}/.zshrc" do
  source 'oh_my_zsh/zshrc'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

template "#{ENV['HOME']}/.oh-my-zsh/themes/jeroen.zsh-theme" do
  source 'oh_my_zsh/jeroen.zsh-theme.erb'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

%w[rails ruby].each do |file|
  cookbook_file "#{ENV['HOME']}/.oh-my-zsh/custom/#{file}.zsh" do
    source "oh_my_zsh/#{file}.zsh"
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

%w[aliases projects exports].each do |file|
  template "#{ENV['HOME']}/.oh-my-zsh/custom/#{file}.zsh" do
    source "oh_my_zsh/#{file}.zsh.erb"
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

execute 'Set default shell to zsh' do
  command 'chsh -s /bin/zsh'
  user node[:elephant][:username]
  group node[:elephant][:group]
  not_if { `printf $SHELL` == '/bin/zsh' }
end
