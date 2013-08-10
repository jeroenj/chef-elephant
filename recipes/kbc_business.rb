remote_file "#{Chef::Config[:file_cache_path]}/O4BMac.pkg" do
  source node[:elephant][:kbc_business][:url]
  checksum node[:elephant][:kbc_business][:checksum]
  not_if { system('pkgutil --pkgs=com.isabel.O4BMac.KBC') }
end

choices_file = ::File.expand_path(File.join(__FILE__, './../../files/default/kbc_business/choices.xml'))
execute 'Install KBC Online 4 Business' do
  command "sudo installer -verbose -applyChoiceChangesXML #{choices_file} -pkg '#{Chef::Config[:file_cache_path]}/O4BMac.pkg' -target /"
  not_if { system('pkgutil --pkgs=com.isabel.O4BMac.KBC') }
end
