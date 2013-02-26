dmg_package "beid-7269" do
  volumes_dir "beid-4.0.4"
  source "http://eid-mw.googlecode.com/files/beid-4.0.4-7269.dmg"
  checksum "fb1bfad0f0b400c80e55df928e5f8f5947113316f963e218efab9245e745afe3"
  owner node["elephant"]["user"]
  action :install
  type "pkg"
  package_id "be.eid.middleware"
end
