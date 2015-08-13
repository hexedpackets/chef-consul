# bootstrap_expect can only be set on server nodes, otherwise
# consul throws an error
if node[:consul][:config][:server]
  node.default[:consul][:config][:bootstrap_expect] = 3
end

package "unzip"

poise_service_user node[:consul][:user] do
  home node[:consul][:config][:data_dir]
end

zip_file = File.join(Chef::Config[:file_cache_path], "consul-#{node[:consul][:version]}.zip")
remote_file zip_file do
  source node[:consul][:download_url]
  notifies :run, "execute[install_consul]", :immediately
end

execute "install_consul" do
  cwd Chef::Config[:file_cache_path]
  command "unzip -o #{zip_file} -d #{node[:consul][:bin_dir]}"
  action :nothing
  notifies :restart, "poise_service[consul]", :delayed
end

[node[:consul][:conf_dir], node[:consul][:config][:data_dir]].each do |dir_name|
  directory dir_name do
    recursive true
    owner node[:consul][:user]
    group node[:consul][:group]
  end
end

conf_file = File.join(node[:consul][:conf_dir], "config.json")
file conf_file do
  owner node[:consul][:user]
  group node[:consul][:group]
  content node[:consul][:config].to_json
end

poise_service "consul" do
  user node[:consul][:user]
  directory node[:consul][:config][:data_dir]
  command "#{node[:consul][:bin_dir]}/consul agent -config-dir #{node[:consul][:conf_dir]}/"
  action [:enable, :start]
end
