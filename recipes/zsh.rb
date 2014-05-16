package 'zsh'

execute 'Set default shell to zsh' do
  command 'chsh -s /bin/zsh'
  user node[:elephant][:username]
  group node[:elephant][:group]
  not_if { `printf $SHELL` == '/bin/zsh' }
end
