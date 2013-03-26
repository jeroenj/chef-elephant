dmg_package 'Google Chrome' do
  dmg_name 'googlechrome'
  source 'https://dl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg'
  checksum '67de3a3a1d4a130912c5e31c9e2917585b3ec85b927d1498c89f9a360d4e052b'
  owner node['elephant']['user']
end

# dmg_package 'beid' do
#   source "http://eid-mw.googlecode.com/files/beid-#{node['elephant']['beid']['version']}.dmg"
#   checksum node['elephant']['beid']['checksum']
#   owner node['elephant']['user']
#   volumes_dir "beid-#{node['elephant']['beid']['version'].split('-').first}"
#   type 'pkg'
#   package_id 'be.eid.middleware'
# end
