dmg_package "Handbrake" do
  volumes_dir "HandBrake-0.9.8-MacOSX.6_GUI_x86_64"
  source "http://handbrake.fr/rotation.php?file=HandBrake-0.9.8-MacOSX.6_GUI_x86_64.dmg"
  checksum "6c1d72d0d305542feb4e2986055a623783bcf77ce2281b2863ccbb8d41204373"
  owner node["elephant"]["user"]
  action :install
end
