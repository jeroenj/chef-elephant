dmg_package 'TogglDesktop' do
  volumes_dir 'Toggl Desktop Installer'
  source node[:elephant][:toggl][:url]
  checksum node[:elephant][:toggl][:checksum]
end
