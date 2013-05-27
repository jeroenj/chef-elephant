dmg_package 'TogglDesktop' do
  volumes_dir 'Toggl Desktop Installer'
  source 'https://download.toggl.com/toggldesktop/latest/TogglDesktopInstaller_Release.dmg'
  checksum node[:elephant][:toggl][:checksum]
end
