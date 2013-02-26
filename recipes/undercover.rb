# FIXME: This should be re-factored once package.rb has a mechanism
# for installing pkg files without mounting a dmg

app_path = "/usr/local/uc/bin/UCAgent.app/Contents/MacOS/UCAgent"
url = "http://assets.undercoverhq.com/client/5.1.2/undercover_mac.pkg"
sha256_digest = "84bc346f16dd5f06f1403fc9d1b3b6173dc531240f586b86d1cb44e18212a139"

ruby_block "Install UnderCover" do
  block do
    filename = "#{Chef::Config[:file_cache_path]}/undercover_mac.pkg"
    system("cd #{Chef::Config[:file_cache_path]}/ && curl -OL #{url}")
    if sha256_digest != Digest::SHA256.file(filename).hexdigest
      raise "Checksum for #{filename} is not what we expected"
    end
    system("installer -package #{filename} -target /")
  end
  not_if {File.exists?(app_path)}
end

ruby_block "test that uc install worked" do
  block do
    raise "Undercover install failed!" if ! File.exists?(app_path)
  end
end
