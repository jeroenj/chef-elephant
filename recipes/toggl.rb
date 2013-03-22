dmg_package 'TogglDesktop' do
  volumes_dir 'Toggl Desktop Installer'
  source 'https://download.toggl.com/toggldesktop/latest/TogglDesktopInstaller_Release.dmg'
  checksum '0c3a4ae06594ff38f201138cef48f885fc6574590033b1a561b9a82989d6c4b2'
  owner node['elephant']['user']
end
