dmg_package 'Jubler' do
  source "http://jubler.googlecode.com/files/Jubler-#{node['elephant']['jubler']['version']}.dmg"
  checksum node['elephant']['vlc']['checksum']
end
