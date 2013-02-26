dmg_package "Trim Enabler" do
  source "http://groths.org/trimenabler/TrimEnabler.dmg"
  checksum "e92ede69b9462998318000f522b9025c76b0417d24969dbcb772b8c4a8372cc0"
  owner node["elephant"]["user"]
  action :install
end
