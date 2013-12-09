include_recipe 'elephant::python'

elephant_pip 'subliminal'
elephant_pip 'colorlog'

node[:elephant][:subliminal][:launch_agents].each do |launch_agent|
  elephant_plist "#{ENV['HOME']}/Library/LaunchAgents/#{launch_agent[:Label]}.plist" do
    content launch_agent
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end
