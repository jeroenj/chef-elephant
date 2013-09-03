default[:elephant][:max][:version] = '0.9.1'
default[:elephant][:max][:url] = "http://files.sbooth.org/Max-#{node[:elephant][:max][:version]}.tar.bz2"
default[:elephant][:max][:checksum] = '6943a30c102bf815c89002671f0f0fd64c1d2805'

default[:elephant][:settings][:max] = {
  'domain' => 'org.sbooth.Max',
  'SUCheckAtStartup' => true,
  'convertInPlace' => true
}
