default[:elephant][:1password][:version] = '3.8.20'
default[:elephant][:1password][:checksum] = '56aef138f06fc92d641c424742bc40887cd19e6029f20409ec06ad5514b8cff1'

default[:mac_os_x][:settings][:1password] = {
  'domain' => 'ws.agile.1password',
  'AgileKeychainLockTimeout' => 1,
  'AGUpdateFrequency' => 1,
  'autosave' => true,
  'autosubmit' => 1,
  'DisplaySidebarFolders' => true,
  'NSOutlineView Items AWSsourceListOutlineView' => %w[tags vault folders],
  'PassGenAllowRepeats' => 0,
  'PassGenAvoidAmbiguous' => false,
  'PassGenDisplayAdvancedOptions' => true,
  'PassGenLength' => 20,
  'PassGenMinNumbers' => 2,
  'PassGenMinSymbols' => 2,
  'PassType' => 'Random'
}
