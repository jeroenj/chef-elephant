dmg_package 'Trim Enabler' do
  source 'http://groths.org/trimenabler/TrimEnabler.dmg'
  checksum node['elephant']['trim_enabler']['checksum']
  owner node['elephant']['user']
end
