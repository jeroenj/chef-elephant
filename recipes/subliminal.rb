include_recipe 'elephant::python'

elephant_pip 'subliminal'

node[:elephant][:subliminal][:launch_agents].each do |launch_agent|
  elephant_plist "#{ENV['HOME']}/Library/LaunchAgents/#{launch_agent[:Label]}.plist" do
    content launch_agent
  end
end
