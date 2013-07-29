# include elephant::settings at the end of the run list to include settings

dmg_package 'Sequel Pro' do
  volumes_dir "Sequel Pro #{node[:elephant][:sequel_pro][:version]}"
  source node[:elephant][:sequel_pro][:url]
  checksum node[:elephant][:sequel_pro][:checksum]
end
