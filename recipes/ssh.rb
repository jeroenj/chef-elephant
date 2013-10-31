directory "#{ENV['HOME']}/.ssh"

template "#{ENV['HOME']}/.ssh/config" do
  source 'ssh/config.erb'
end

private_key = node[:elephant][:ssh][:private_key]
public_key = node[:elephant][:ssh][:public_key]

if private_key && public_key
  file "#{ENV['HOME']}/.ssh/id_rsa" do
    content private_key
    mode 00600
  end

  file "#{ENV['HOME']}/.ssh/id_rsa.pub" do
    content public_key
    mode 00644
  end
end
