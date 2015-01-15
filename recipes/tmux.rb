package 'tmux'

cookbook_file "#{ENV['HOME']}/.tmux.conf" do
  source 'tmux/tmux.conf'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
