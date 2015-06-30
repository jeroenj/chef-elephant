action :install do
  execute "Install #{new_resource.name} with pip" do
    command "pip install #{new_resource.name}"
    user node[:elephant][:username]
    group node[:elephant][:group]
    not_if "pip show #{new_resource.name} --quiet"
  end
end
