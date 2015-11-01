default[:elephant][:plexconnect][:revision] = 'v0.3.1'
default[:elephant][:plexconnect][:path] = ::File.join node[:elephant][:apps_path], 'plexconnect'

default[:elephant][:plexconnect] = {
  settings: {
    hosttointercept: 'trailers.apple.com'
  },
  launch_daemon: {
    'Label' => 'plexconnect',
    'ProgramArguments' => [
      '/usr/local/bin/python',
      "#{node[:elephant][:plexconnect][:path]}/PlexConnect.py"
    ],
    'StandardErrorPath' => "#{ENV['HOME']}/Library/Logs/plexconnect.error.log",
    'StandardOutPath' => "#{ENV['HOME']}/Library/Logs/plexconnect.access.log",
    'WorkingDirectory' => node[:elephant][:plexconnect][:path],
    'RunAtLoad' => true,
    'KeepAlive' => true
  }
}
