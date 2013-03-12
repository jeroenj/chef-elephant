default['mac_os_x']['settings']['gitx'] = {
  'domain' => 'nl.frim.GitX',
  'user' => node['elephant']['user'],
  'PBShowOpenPanelOnLaunch' => false,
  'PBRefreshAutomatically' => false,
  'gitExecutable' => '/usr/local/bin/git',
  'SUEnableAutomaticChecks' => true,
  'NSToolbar Configuration A66F2540-5B64-4016-89F7-892563371FAF' => {
    'TB Is Shown' => 0
  }
}
