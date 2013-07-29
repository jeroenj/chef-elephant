dmg_package 'Skype' do
  source node[:elephant][:skype][:url]
  checksum node[:elephant][:skype][:checksum]
end
