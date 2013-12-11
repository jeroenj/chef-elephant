default[:elephant][:nginx] = {
  :vhosts => [],
  :launch_agent => {
    'Label' => 'nginx',
    'ProgramArguments' => [
      '/usr/local/bin/nginx',
      '-g',
      'daemon off;'
    ],
    'RunAtLoad' => true,
    'KeepAlive' => true,
    'WorkingDirectory' => '/usr/local'
  }
}
