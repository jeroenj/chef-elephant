'http://storage.googleapis.com/incrediblebee/apps/Archiver/Archiver.zip'


remote_file "#{Chef::Config[:file_cache_path]}/Archiver.zip" do
  checksum '7da3c87a788b896a276801a2dee700b5072519d81620648011732d7c9692dbb0'
  source 'http://storage.googleapis.com/incrediblebee/apps/Archiver/Archiver.zip'
  not_if { ::File.directory?('/Applications/Archiver.app') }
end

execute 'Install Archiver' do
  command "unzip #{Chef::Config[:file_cache_path]}/Archiver.zip"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Archiver.app') }
end
