dmg_package 'Doxie' do
  source node[:elephant][:doxie][:url]
  checksum node[:elephant][:doxie][:checksum]
end

preferences_directory = "#{ENV['HOME']}/Library/Preferences/Apparent/Doxie"

directory preferences_directory do
  recursive true
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

cookbook_file "#{preferences_directory}/Preferences.xml" do
  source 'doxie/Preferences.xml'
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
