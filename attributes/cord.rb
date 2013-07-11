default[:elephant][:cord][:version] = '0.5.7'
default[:elephant][:cord][:url] = "http://sourceforge.net/projects/cord/files/cord/#{node[:elephant][:cord][:version]}/CoRD_#{node[:elephant][:cord][:version]}.zip/download"
default[:elephant][:cord][:checksum] = '8f505b12b94167100b3b8b44ed3cee32ffcc94b73dc44fe0ecc896151f114100'

default[:elephant][:settings][:cord] = {
  'domain' => 'net.sf.cord',
  'CRDBaseConnectionScreenSize' => '1280x800',
  'SUEnableAutomaticChecks' => true,
  'SUCheckAtStartup' => true
}
