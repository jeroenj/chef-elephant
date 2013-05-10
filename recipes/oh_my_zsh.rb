git "#{ENV['HOME']}/.oh-my-zsh" do
  repository 'https://github.com/robbyrussell/oh-my-zsh.git'
  action :sync
end

cookbook_file "#{ENV['HOME']}/.zshrc" do
  source 'oh_my_zsh/zshrc'
end

cookbook_file "#{ENV['HOME']}/.oh-my-zsh/themes/jeroen.zsh-theme" do
  source 'oh_my_zsh/jeroen.zsh-theme'
end

%w[aliases exports projects rails ruby].each do |file|
  cookbook_file "#{ENV['HOME']}/.oh-my-zsh/custom/#{file}.zsh" do
    source "oh_my_zsh/#{file}.zsh"
  end
end

execute 'Set default shell to zsh' do
  command 'chsh -s /bin/zsh'
end
