default[:elephant][:time_machine][:launch_daemon] = {
  'Label' => 'timemachine',
  'EnableTransactions' => true,
  'KeepAlive' => false,
  'Program' => '/System/Library/CoreServices/backupd.bundle/Contents/Resources/backupd-helper',
  'RunAtLoad' => false,
  'StartCalendarInterval' => {
    'Hour' => 3,
    'Minute' => 0
  }
}
