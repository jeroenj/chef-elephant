node[:elephant][:user_aliases][:aliases].each do |user_alias|
  execute "create #{user_alias} alias" do
    command "dscl . -append /Users/#{node[:elephant][:username]} RecordName #{user_alias}"
    not_if "dscl . -read /Users/#{node[:elephant][:username]} RecordName | grep #{user_alias}"
  end
end
