dmg_package 'VMware Fusion' do
  source node[:elephant][:vmware_fusion][:url]
  checksum node[:elephant][:vmware_fusion][:checksum]
end
