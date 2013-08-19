git "#{ENV['HOME']}/.oh-my-zsh" do
  repository 'https://github.com/robbyrussell/oh-my-zsh.git'
  action :sync
end

cookbook_file "#{ENV['HOME']}/.zshrc" do
  source 'oh_my_zsh/zshrc'
end

template "#{ENV['HOME']}/.oh-my-zsh/themes/jeroen.zsh-theme" do
  source 'oh_my_zsh/jeroen.zsh-theme.erb'
end

%w[aliases exports rails ruby].each do |file|
  cookbook_file "#{ENV['HOME']}/.oh-my-zsh/custom/#{file}.zsh" do
    source "oh_my_zsh/#{file}.zsh"
  end
end

template "#{ENV['HOME']}/.oh-my-zsh/custom/projects.zsh" do
  source 'oh_my_zsh/projects.zsh.erb'
end

execute 'Set default shell to zsh' do
  command 'chsh -s /bin/zsh'
  not_if { `printf $SHELL` == "/bin/zsh" }
end
