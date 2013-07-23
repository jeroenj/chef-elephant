default[:elephant][:hipchat][:version] = '2.0'
default[:elephant][:hipchat][:url] = "http://downloads.hipchat.com.s3.amazonaws.com/osx/HipChat-#{node[:elephant][:hipchat][:version]}.zip"
default[:elephant][:hipchat][:checksum] = '1552c87662d6d31161fba447c28e9f9c3ace1377'

default[:elephant][:settings][:hipchat] = {
  'domain' => 'com.hipchat.HipChat',
  'notifyForPrivate' => true,
  'notifyForPrivateRoom' => false,
  'showToasters' => false,
  'SUEnableAutomaticChecks' => true
}
