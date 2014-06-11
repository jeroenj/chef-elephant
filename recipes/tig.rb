package 'tig'

cookbook_file "#{ENV['HOME']}/.tigrc" do
  source 'tig/tigrc'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
