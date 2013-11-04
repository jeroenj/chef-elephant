package 'pure-ftpd'

launch_agents_path = '/Library/LaunchAgents'
launch_agent_name = 'homebrew.mxcl.pure-ftpd.plist'
launch_agent_path = File.join launch_agents_path, launch_agent_name

# The following two execute blocks are a hack to allow
# chef to change files in a root-owned directory.
ruby_block 'Weaken pureftpd LaunchAgent permissions and ownership' do
  block do
    `sudo chmod 777 #{launch_agents_path}`
    `sudo chown $(whoami):staff #{launch_agent_path}`
  end

  only_if do
    src = File.expand_path File.join(__FILE__, '../../files/default/pureftpd', launch_agent_name)
    !File.exists?(launch_agent_path) || (Chef::Digester.checksum_for_file(launch_agent_path) != Chef::Digester.checksum_for_file(src))
  end
  notifies :run, 'ruby_block[Reset pureftpd LaunchAgent permissions and ownership]'
end

ruby_block 'Reset pureftpd LaunchAgent permissions and ownership' do
  block do
    `sudo chmod 755 #{launch_agents_path}`
    `sudo chown root:wheel #{launch_agent_path}`
  end
  action :nothing
end

cookbook_file '/Library/LaunchAgents/homebrew.mxcl.pure-ftpd.plist' do
  source 'pureftpd/homebrew.mxcl.pure-ftpd.plist'
  mode 0644
end

template '/usr/local/etc/pureftpd.passwd' do
  source 'pureftpd/pureftpd.passwd.erb'
  variables :accounts => node[:elephant][:pureftpd][:accounts]
  notifies :run, 'execute[Update pureftpd database]'
end

execute 'Update pureftpd database' do
  command 'pure-pw mkdb'
  action :nothing
end
