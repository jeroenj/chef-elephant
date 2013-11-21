action :override do
  destination = ::File.dirname(new_resource.name)

  ruby_block "Weaken #{destination} permissions and ownership" do
    block { `sudo chmod o+w #{destination}` }

    only_if do
      source = ::File.expand_path ::File.join(__FILE__, '../..', new_resource.source)
      !::File.exists?(new_resource.name) || (Chef::Digester.checksum_for_file(new_resource.name) != Chef::Digester.checksum_for_file(source))
    end
    notifies :run, "ruby_block[Reset #{destination} permissions and ownership]"
  end

  ruby_block "Reset #{destination} permissions and ownership" do
    block { `sudo chmod o-w #{destination}` }
    action :nothing
  end
end
