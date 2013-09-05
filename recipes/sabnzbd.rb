# dmg_package 'SABnzbd' do
#   source node[:elephant][:sabnzbd][:url]
#   checksum node[:elephant][:sabnzbd][:checksum]
#   volumes_dir "SABnzbd-#{node[:elephant][:sabnzbd][:version]}/OS X 10.8 (Mountain Lion)"
# end

# Since the app is inside a folder in the dmg we can not use the dmg_package lwrp.
# Below are all the commands needed to install the app. It does exactly the same as
# dmg_package, but uses the correct folders.
# ignore_failure was not a noption for dmg_package either, since it fails from one
# of its sub lwrp's: the shellout to detach the image failed.

volumes_dir = "/Volumes/SABnzbd-#{node[:elephant][:sabnzbd][:version]}"
app_path = '/Applications/SABnzbd.app'

dmg_file = "#{Chef::Config[:file_cache_path]}/SABnzbd-#{node[:elephant][:sabnzbd][:version]}.dmg"

remote_file dmg_file do
  source node[:elephant][:sabnzbd][:url]
  checksum node[:elephant][:sabnzbd][:checksum]
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

# dmg_package replacement ends here

if node[:elephant][:sabnzbd][:preferences]
  settings_path = "#{ENV['HOME']}/Library/Application Support/SABnzbd"
  scripts_path = ::File.expand_path 'scripts', settings_path

  directory scripts_path do
    recursive true
  end

  template ::File.expand_path('sabnzbd.ini', settings_path) do
    source 'sabnzbd/sabnzbd.ini.erb'
    variables({
      :username => node[:elephant][:sabnzbd][:preferences][:username],
      :password => node[:elephant][:sabnzbd][:preferences][:password],
      :api_key => node[:elephant][:sabnzbd][:preferences][:api_key],
      :https => node[:elephant][:sabnzbd][:preferences][:https],
      :servers => node[:elephant][:sabnzbd][:preferences][:servers],
      :tv => node[:elephant][:sabnzbd][:preferences][:tv],
      :movies => node[:elephant][:sabnzbd][:preferences][:movies]
    })
  end

  if node[:elephant][:sabnzbd][:tv] || node[:elephant][:sabnzbd][:movies]
    if node[:elephant][:sabnzbd][:tv]
      %w[autoProcessTV.py sabToSickBeard.py].each do |file|
        cookbook_file ::File.expand_path(file, scripts_path) do
          source "sabnzbd/#{file}"
        end
      end

      template ::File.expand_path('autoProcessTV.cfg', scripts_path) do
        source 'sabnzbd/autoProcessTV.cfg.erb'
        variables({
          :host => node[:elephant][:sabnzbd][:tv][:sickbeard][:host],
          :port => node[:elephant][:sabnzbd][:tv][:sickbeard][:port],
          :username => node[:elephant][:sabnzbd][:tv][:sickbeard][:username],
          :password => node[:elephant][:sabnzbd][:tv][:sickbeard][:password],
          :ssl => node[:elephant][:sabnzbd][:tv][:sickbeard][:ssl]
        })
      end
    end

    if node[:elephant][:sabnzbd][:movies]
      template ::File.expand_path('update_plex_movies.sh', scripts_path) do
        source 'sabnzbd/update_plex_movies.sh.erb'
        variables({
          :plex_movies_id => node[:elephant][:sabnzbd][:movies][:plex_movies_id]
        })
      end
    end
  end
end
