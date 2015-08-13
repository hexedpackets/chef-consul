remote_file File.join(Chef::Config[:file_cache_path], "consul-#{node[:consul][:version]}-ui.zip") do
  source node[:consul][:ui_download_url]
  notifies :run, "execute[install_consul_ui]", :immediately
end

execute "install_consul_ui" do
  cwd Chef::Config[:file_cache_path]
  command "unzip -o consul-#{node[:consul][:version]}-ui.zip -d #{node[:consul][:config][:ui_dir]}"
  action :nothing
end
