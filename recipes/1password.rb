include_recipe 'mac_os_x::settings'

# Not supported for now since it seems impossible to add nested array/dictionaries using defaults

# remote_file "#{ENV['HOME']}/Library/Safari/Extensions/1Password.safariextz" do
#   action :create_if_missing
#   backup false
#   source "http://aws.cachefly.net/dist/1P/ext/1Password.safariextz"
# end

# mac_os_x_userdefaults "Install 1Password Safari extension" do
#   domain "#{ENV['HOME']}/Library/Safari/Extensions/Extensions.plist"
#   sudo false
#   key "Installed Extensions"
#   value [{
#     "Archive File Name" => "!Password-1.safariextz",
#     "Bundle Directory Name" => "1Password.safariextension",
#     "Enabled" => true
#   }]
# end

# In attributes:

# default[:mac_os_x][:settings][:1password_extension] = {
#   'domain' => "#{ENV['HOME']}/Library/Safari/Extensions/Extensions.plist",
#   "Installed Extensions" => [
#     {
#       "Archive File Name" => "!Password-1.safariextz",
#       "Bundle Directory Name" => "1Password.safariextension",
#       "Enabled" => true
#     }
#   ]
# }
