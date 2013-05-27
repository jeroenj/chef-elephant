dmg_package 'Sequel Pro' do
  volumes_dir "Sequel Pro #{node[:elephant][:sequel_pro][:version]}"
  source "http://sequel-pro.googlecode.com/files/sequel-pro-#{node[:elephant][:sequel_pro][:version]}.dmg"
  checksum node[:elephant][:sequel_pro][:checksum]
end
