default[:elephant][:sickbeard][:launch_agent] = {
  'Label' => 'sickbeard',
  'ProgramArguments' => [
    '/usr/local/bin/python',
    "#{ENV['HOME']}/apps/sickbeard/SickBeard.py",
    '-q'
  ],
  'RunAtLoad' => true,
  'KeepAlive' => true
}
