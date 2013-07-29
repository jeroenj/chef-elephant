dmg_package 'beid' do
  source node[:elephant][:beid][:url]
  checksum node[:elephant][:beid][:checksum]
  app "beid-#{node[:elephant][:beid][:version].split('-').last}"
  volumes_dir "beid-#{node[:elephant][:beid][:version].split('-').first}"
  type 'pkg'
  package_id 'be.eid.middleware'
end
