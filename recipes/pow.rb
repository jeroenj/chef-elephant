remote_file "#{Chef::Config[:file_cache_path]}/pow_install.sh" do
  checksum '00cbe8ef05690826c85ba98fc09ebe70f7608853c6f85dcdec61135bafdcbb00'
  source 'http://get.pow.cx'
  mode '0755'
end

execute 'Install pow' do
  command "#{Chef::Config[:file_cache_path]}/pow_install.sh"
end
