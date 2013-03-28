dmg_package 'Skype' do
  source "http://download.skype.com/macosx/Skype_#{node['elephant']['skype']['version']}.dmg"
  checksum node['elephant']['skype']['checksum']
  owner node['elephant']['user']
end
