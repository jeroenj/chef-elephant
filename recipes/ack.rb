package 'ack'

cookbook_file "#{ENV['HOME']}/.ackrc" do
  source 'ack/ackrc'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
