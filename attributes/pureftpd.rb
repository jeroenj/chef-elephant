default[:elephant][:pureftpd][:accounts] = []

default[:elephant][:pureftpd][:launch_daemon] = {
  'Label' => 'pureftpd',
  'ProgramArguments' => [
    '/usr/local/sbin/pure-ftpd',
    '--chrooteveryone',
    '--login',
    'puredb:/usr/local/etc/pureftpd.pdb'
  ],
  'RunAtLoad' => true,
  'KeepAlive' => true,
  'WorkingDirectory' => '/usr/local/var',
  'StandardErrorPath' => '/usr/local/var/log/pure-ftpd.log',
  'StandardOutPath' => '/usr/local/var/log/pure-ftpd.log'
}
