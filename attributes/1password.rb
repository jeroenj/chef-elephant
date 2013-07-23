default[:elephant][:settings][:'1password'] = {
  'domain' => "#{ENV['HOME']}/Library/Containers/com.agilebits.onepassword-osx/Data/Library/Preferences/com.agilebits.onepassword-osx.plist",
  'DisplaySidebarPasswords' => true,
  'EnableUniversalUnlock' => true,
  'KeepHelperRunning' => true,
  'LockTimeout' => 10,
  'NSOutlineView Items AWSsourceListOutlineView' => %w[tags vault folders],
  'PassGenAllowRepeats' => false,
  'PassGenAvoidAmbiguous' => true,
  'PassGenDisplayAdvancedOptions' => true,
  'PassGenLength' => 20,
  'PassGenMinNumbers' => 2,
  'PassGenMinSymbols' => 2,
  'PassType' => 'Random'
}

default[:elephant][:settings][:'1password_helper'] = {
  'domain' => "#{ENV['HOME']}/Library/Containers/com.agilebits.onepassword-osx-helper/Data/Library/Preferences/com.agilebits.onepassword-osx-helper.plist",
  'ShowStatusItem' => false
}
