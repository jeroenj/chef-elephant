dmg_package "Java #{node[:elephant][:java][:version]}" do
  source node[:elephant][:java][:url]
  checksum node[:elephant][:java][:checksum]
  type 'pkg'
  package_id 'com.oracle.jre'
end
