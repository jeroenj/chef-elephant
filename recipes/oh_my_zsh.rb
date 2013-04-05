git "#{ENV['HOME']}/.oh-my-zsh" do
  repository 'https://github.com/robbyrussell/oh-my-zsh.git'
  user node['elephant']['user']
  action :sync
end

cookbook_file "#{ENV['HOME']}/.zshrc" do
  source 'oh_my_zsh/zshrc'
  owner node['elephant']['user']
end

cookbook_file "#{ENV['HOME']}/.oh-my-zsh/themes/jeroen.zsh-theme" do
  source 'oh_my_zsh/jeroen.zsh-theme'
  owner node['elephant']['user']
end

%w[aliases exports logs projects rails].each do |file|
  cookbook_file "#{ENV['HOME']}/.oh-my-zsh/custom/#{file}.zsh" do
    source "oh_my_zsh/#{file}.zsh"
    owner node['elephant']['user']
  end
end

execute 'Set default shell to zsh' do
  command 'chsh -s /bin/zsh'
end
