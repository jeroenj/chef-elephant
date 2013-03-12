default['mac_os_x']['settings']['gitx'] = {
  'domain' => 'nl.frim.GitX',
  'user' => node['elephant']['user'],
  'PBShowOpenPanelOnLaunch' => false,
  'PBRefreshAutomatically' => false,
  'gitExecutable' => '/usr/local/bin/git',
  'SUEnableAutomaticChecks' => true
}
