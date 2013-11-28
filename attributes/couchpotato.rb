default[:elephant][:couchpotato][:launch_agent] = {
  'Label' => 'couchpotato',
  'ProgramArguments' => [
    '/usr/local/bin/python',
    "#{ENV['HOME']}/apps/couchpotato/CouchPotato.py",
    '--quiet'
  ],
  'RunAtLoad' => true,
  'KeepAlive' => true
}
