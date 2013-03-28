dmg_package 'VLC' do
  source "http://download.videolan.org/vlc/#{node['elephant']['vlc']['version']}/macosx/vlc-#{node['elephant']['vlc']['version']}.dmg"
  checksum node['elephant']['vlc']['checksum']
  owner node['elephant']['user']
  dmg_name "vlc-#{node['elephant']['vlc']['version']}"
  volumes_dir "vlc-#{node['elephant']['vlc']['version']}"
end
