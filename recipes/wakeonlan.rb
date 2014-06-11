package 'wakeonlan'

directory "#{ENV['HOME']}/.wakeonlan" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

node[:elephant][:wakeonlan][:devices].each do |name, device|
  file "#{ENV['HOME']}/.wakeonlan/#{name}" do
    content [device[:mac_address], device[:host], device[:port]].compact.join(' ')
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end
