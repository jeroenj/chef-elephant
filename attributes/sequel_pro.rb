default[:elephant][:sequel_pro][:version] = '1.0.1'
default[:elephant][:sequel_pro][:url] = "http://sequel-pro.googlecode.com/files/sequel-pro-#{node[:elephant][:sequel_pro][:version]}.dmg"
default[:elephant][:sequel_pro][:checksum] = '256873df2bdaebad9997acb2182428790454cb577d2c1af9565ecc4f670ebf92'

default[:elephant][:settings][:sequel_pro] = {
  'domain' => 'com.sequelpro.SequelPro',
  'SUEnableAutomaticChecks' => true,
  'CustomQueryAutoUppercaseKeywords' => true,
  'SUEnableAutomaticChecks' => true,
}
