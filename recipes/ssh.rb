directory "#{ENV['HOME']}/.ssh" do
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

template "#{ENV['HOME']}/.ssh/config" do
  source 'ssh/config.erb'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

private_key = node[:elephant][:ssh][:private_key]
public_key = node[:elephant][:ssh][:public_key]
authorized_keys = node[:elephant][:ssh][:authorized_keys]

if private_key && public_key
  file "#{ENV['HOME']}/.ssh/id_rsa" do
    content private_key
    mode 00600
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end

  file "#{ENV['HOME']}/.ssh/id_rsa.pub" do
    content public_key
    mode 00644
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end

if authorized_keys.any?
  file "#{ENV['HOME']}/.ssh/authorized_keys" do
    content ([public_key] + authorized_keys).compact.join("\n")
    mode 00644
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end
