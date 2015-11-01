homebrew_cask 'sabnzbd'

if node[:elephant][:sabnzbd][:preferences]
  settings_path = "#{ENV['HOME']}/Library/Application Support/SABnzbd"
  scripts_path = ::File.expand_path 'scripts', settings_path

  elephant_recursive_directory scripts_path do
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end

  template ::File.expand_path('sabnzbd.ini', settings_path) do
    source 'sabnzbd/sabnzbd.ini.erb'
    variables(
      username: node[:elephant][:sabnzbd][:preferences][:username],
      password: node[:elephant][:sabnzbd][:preferences][:password],
      api_key: node[:elephant][:sabnzbd][:preferences][:api_key],
      https: node[:elephant][:sabnzbd][:preferences][:https],
      https_port: node[:elephant][:sabnzbd][:preferences][:https_port],
      https_key: node[:elephant][:sabnzbd][:preferences][:https_key],
      https_cert: node[:elephant][:sabnzbd][:preferences][:https_cert],
      osx_speed: node[:elephant][:sabnzbd][:preferences][:osx_speed],
      schedule: node[:elephant][:sabnzbd][:preferences][:schedule],
      servers: node[:elephant][:sabnzbd][:preferences][:servers],
      tv: node[:elephant][:sabnzbd][:tv],
      movies: node[:elephant][:sabnzbd][:movies]
    )
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end

  if node[:elephant][:sabnzbd][:tv] || node[:elephant][:sabnzbd][:movies]
    if node[:elephant][:sabnzbd][:tv]
      %w(autoProcessTV.py sabToSickBeard.py).each do |file|
        link ::File.expand_path(file, scripts_path) do
          to ::File.join(node[:elephant][:apps_path], 'sickbeard/autoProcessTV', file)
          owner node[:elephant][:username]
          group node[:elephant][:group]
        end
      end

      template ::File.expand_path('autoProcessTV.cfg', scripts_path) do
        source 'sabnzbd/autoProcessTV.cfg.erb'
        variables(
          host: node[:elephant][:sabnzbd][:tv][:sickbeard][:host],
          port: node[:elephant][:sabnzbd][:tv][:sickbeard][:port],
          username: node[:elephant][:sabnzbd][:tv][:sickbeard][:username],
          password: node[:elephant][:sabnzbd][:tv][:sickbeard][:password],
          ssl: node[:elephant][:sabnzbd][:tv][:sickbeard][:ssl]
        )
        owner node[:elephant][:username]
        group node[:elephant][:group]
      end
    end

    if node[:elephant][:sabnzbd][:movies]
      template ::File.expand_path('update_plex_movies.sh', scripts_path) do
        source 'sabnzbd/update_plex_movies.sh.erb'
        variables(
          plex_movies_id: node[:elephant][:sabnzbd][:movies][:plex_movies_id]
        )
        mode 0755
        owner node[:elephant][:username]
        group node[:elephant][:group]
      end
    end
  end
end

if node[:elephant][:sabnzbd][:launch_agent]
  elephant_plist "#{ENV['HOME']}/Library/LaunchAgents/sabnzbd.plist" do
    content node[:elephant][:sabnzbd][:launch_agent]
    owner node[:elephant][:username]
    group node[:elephant][:group]
  end
end
