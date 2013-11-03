file = "#{Chef::Config[:file_cache_path]}/plex_media_center_#{node[:elephant][:plex_media_center][:version]}.zip"

remote_file file do
  source node[:elephant][:plex_media_center][:url]
  checksum node[:elephant][:plex_media_center][:checksum]
  not_if { ::File.directory?('/Applications/Plex.app') }
end

execute 'Install Plex Media Center' do
  command "unzip #{file}"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Plex.app') }
end

directory "#{ENV['HOME']}/Library/Application Support/Plex/userdata" do
  recursive true
end

template "#{ENV['HOME']}/Library/Application Support/Plex/userdata/guisettings.xml" do
  source 'plex_media_center/guisettings.xml.erb'
  variables(
    :myplex => node[:elephant][:plex_media_center][:preferences][:myplex],
    :lastfm => node[:elephant][:plex_media_center][:preferences][:lastfm]
  )
end
