include_recipe 'homebrew'

taps = %w(
  homebrew/dupes
  caskroom/cask
  caskroom/eid
  caskroom/versions
)

taps.each do |tap|
  homebrew_tap tap
end

elephant_recursive_directory '/usr/local/var/log' do
  owner node[:elephant][:username]
  group 'admin'
end

include_recipe 'homebrew::install_formulas'
