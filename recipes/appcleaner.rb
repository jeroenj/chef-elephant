# include elephant::settings at the end of the run list to include settings

remote_file "#{Chef::Config[:file_cache_path]}/AppCleaner_2.1.zip" do
  checksum '4d3482f1622ee1eade872489b90235002f9c9459525d22ddd9d9e5b8d986f391'
  source 'http://www.freemacsoft.net/downloads/AppCleaner_2.1.zip'
  not_if { ::File.directory?('/Applications/AppCleaner.app') }
end

execute 'Install AppCleaner' do
  command "unzip #{Chef::Config[:file_cache_path]}/AppCleaner_2.1.zip"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/AppCleaner.app') }
end
