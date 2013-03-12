homebrew_tap 'homebrew/dupes'

node['elephant']['homebrew']['packages'].each do |package|
  package package do
    action :install
  end
end
