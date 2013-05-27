dmg_package 'Tunnelblick' do
  dmg_name "Tunnelblick_#{node[:elephant][:tunnelblick][:version]}.dmg"
  source "http://tunnelblick.googlecode.com/files/Tunnelblick_#{node[:elephant][:tunnelblick][:version]}.dmg"
  checksum node[:elephant][:tunnelblick][:checksum]
end
