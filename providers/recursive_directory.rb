require 'pathname'

action :create do
  path = Pathname.new(new_resource.path)

  until path.to_s == new_resource.parent
    directory "#{path} for #{new_resource.path}" do
      path path.to_s
      owner new_resource.owner
      group new_resource.group
      recursive true
    end
    path = path.parent
  end
end
