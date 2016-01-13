directory "#{ENV['HOME']}/.chef" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

%w(client.pem client.pub validation.pem).each do |filename|
  file "#{ENV['HOME']}/.chef/#{filename}" do
    content node[:elephant][:chef][filename.sub(/\./, '_')]
    mode 0600
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

template "#{ENV['HOME']}/.chef/knife.rb" do
  source 'chef/knife.rb.erb'
  variables({
    cookbook_copyright: node[:elephant][:chef][:knife][:cookbook_copyright],
    cookbook_email: node[:elephant][:chef][:knife][:cookbook_email],
    cookbook_path: node[:elephant][:chef][:knife][:cookbook_path],
    node_name: node[:elephant][:chef][:knife][:node_name]
  })
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
