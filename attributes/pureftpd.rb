default[:elephant][:pureftpd][:accounts] = []

default[:elephant][:pureftpd][:launch_agent] = {
  'Label' => 'pureftpd',
  'ProgramArguments' => [
    '/usr/local/sbin/pure-ftpd',
    '--chrooteveryon',
    '--login',
    'puredb:/usr/local/etc/pureftpd.pd'
  ],
  'RunAtLoad' => true,
  'KeepAlive' => true,
  'WorkingDirectory' => '/usr/local/var',
  'StandardErrorPath' => '/usr/local/var/log/pure-ftpd.log',
  'StandardOutPath' => '/usr/local/var/log/pure-ftpd.log'
}
