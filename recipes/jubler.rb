dmg_package 'Jubler' do
  source node[:elephant][:jubler][:url]
  checksum node[:elephant][:vlc][:checksum]
end
