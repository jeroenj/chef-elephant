dmg_package 'XQuartz' do
  source node[:xquartz][:url]
  checksum node[:xquartz][:checksum]
  volumes_dir "XQuartz-#{node['xquartz']['version']}"
  package_id 'org.macosforge.xquartz.pkg'
  type 'pkg'
end
