dmg_package 'Dropbox' do
  source node[:elephant][:dropbox][:url]
  checksum node[:elephant][:dropbox][:checksum]
  volumes_dir 'Dropbox Installer'
end

link "#{ENV['HOME']}/Development" do
  to "#{ENV['HOME']}/Dropbox/Development"
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
