dmg_package 'Firefox' do
  source node[:elephant][:firefox][:url]
  checksum node[:elephant][:firefox][:checksum]
  # app "beid-#{node[:elephant][:beid][:version].split('-').last}"
  # volumes_dir "beid-#{node[:elephant][:beid][:version].split('-').first}"
  # type 'pkg'
  # package_id 'be.eid.middleware'
end
