default['mac_os_x']['settings']['appcleaner'] = {
  'domain' => 'com.freemacsoft.AppCleaner',
  'user' => node['elephant']['user'],
  'SUCheckAtStartup' => true,
  'SUEnableAutomaticChecks' => true
}
