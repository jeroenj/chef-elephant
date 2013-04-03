dmg_package "Java #{node['elephant']['java']['version']}" do
  source node['elephant']['java']['url']
  checksum node['elephant']['java']['checksum']
  owner node['elephant']['user']
  type 'pkg'
  package_id 'com.oracle.jre'
end
