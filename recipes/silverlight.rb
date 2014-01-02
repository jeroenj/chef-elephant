dmg_package 'Silverlight' do
  source node[:elephant][:silverlight][:url]
  checksum node[:elephant][:silverlight][:checksum]
  type 'pkg'
  package_id 'com.microsoft.SilverlightInstaller'
end
