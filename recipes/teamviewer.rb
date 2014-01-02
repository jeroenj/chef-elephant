dmg_package 'TeamViewer' do
  source node[:elephant][:teamviewer][:url]
  checksum node[:elephant][:teamviewer][:checksum]
  app 'Install TeamViewer'
  volumes_dir 'TeamViewer'
  type 'pkg'
  package_id 'com.teamviewer.teamviewer9'
end
