# dmg_package 'SABnzbd' do
#   source node[:elephant][:sabnzbdplus][:url]
#   checksum node[:elephant][:sabnzbdplus][:checksum]
#   volumes_dir "SABnzbd-#{node[:elephant][:sabnzbdplus][:version]}/OS X 10.8 (Mountain Lion)"
# end

# Since the app is inside a folder in the dmg we can not use the dmg_package lwrp.
# Below are all the commands needed to install the app. It does exactly the same as
# dmg_package, but uses the correct folders.
# ignore_failure was not a noption for dmg_package either, since it fails from one
# of its sub lwrp's: the shellout to detach the image failed.

volumes_dir = "/Volumes/SABnzbd-#{node[:elephant][:sabnzbdplus][:version]}"
app_path = '/Applications/SABnzbd.app'

dmg_file = "#{Chef::Config[:file_cache_path]}/SABnzbdplus.dmg"

remote_file dmg_file do
  source node[:elephant][:sabnzbdplus][:url]
  checksum node[:elephant][:sabnzbdplus][:checksum]
  not_if { ::File.directory? app_path }
end

execute "hdiutil attach '#{dmg_file}'" do
  not_if { ::File.directory? app_path }
end

execute "cp -R '#{volumes_dir}/OS X 10.8 (Mountain Lion)/SABnzbd.app' '/Applications'" do
  not_if { ::File.directory? app_path }
end

file "#{app_path}/Contents/MacOS/SABnzbd.app" do
  mode 0755
  ignore_failure true
end

execute "hdiutil detach '#{volumes_dir}'" do
  only_if { ::File.directory? volumes_dir }
end
