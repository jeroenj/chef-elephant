default[:elephant][:vpn] = {
  pptp_enabled: true,
  l2tp_enabled: true,
  dns_servers: ['8.8.8.8', '8.8.4.4'],
  ip_range: ['10.0.0.240', '10.0.0.255'],
  log_file: '/var/log/ppp/vpnd.log',
  chap_secrets: [],
  launch_daemons: {
    pptp: {
      'Label' => 'vpn.pptp',
      'ProgramArguments' => [
        '/usr/sbin/vpnd',
        '-x',
        '-i',
        'com.apple.ppp.pptp'
      ],
      'RunAtLoad' => true,
      'KeepAlive' => true
    },
    l2tp: {
      'Label' => 'vpn.l2tp',
      'ProgramArguments' => [
        '/usr/sbin/vpnd',
        '-x',
        '-i',
        'com.apple.ppp.l2tp'
      ],
      'RunAtLoad' => true,
      'KeepAlive' => true
    }
  }
}
