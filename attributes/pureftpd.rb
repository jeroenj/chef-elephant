default[:elephant][:pureftpd] = {
  accounts: [],
  log_file: '/usr/local/var/log/pure-ftpd.log'
}

default[:elephant][:pureftpd][:launch_daemon] = {
  'Label' => 'pureftpd',
  'ProgramArguments' => [
    '/usr/local/sbin/pure-ftpd',
    '--syslogfacility',
    'none',
    '--altlog',
    "clf:#{node[:elephant][:pureftpd][:log_file]}",
    '--chrooteveryone',
    '--login',
    'puredb:/usr/local/etc/pureftpd.pdb'
  ],
  'RunAtLoad' => true,
  'KeepAlive' => true,
  'WorkingDirectory' => '/usr/local/var',
  'StandardErrorPath' => node[:elephant][:pureftpd][:log_file],
  'StandardOutPath' => node[:elephant][:pureftpd][:log_file]
}
