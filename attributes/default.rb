default[:consul][:user] = 'consul'
default[:consul][:group] = 'consul'

default[:consul][:version] = "0.5.2"
default[:consul][:download_url] = "https://dl.bintray.com/mitchellh/consul/#{node[:consul][:version]}_linux_amd64.zip"
default[:consul][:ui_download_url] = "https://dl.bintray.com/mitchellh/consul/#{node[:consul][:version]}_web_ui.zip"
default[:consul][:conf_dir] = "/etc/consul"
default[:consul][:bin_dir] = "/usr/local/bin"

default[:consul][:config][:server] = false
default[:consul][:config][:log_level] = "INFO"
default[:consul][:config][:ui_dir] = "/opt/consului"
default[:consul][:config][:client_addr] = "0.0.0.0"
default[:consul][:config][:ports] = {
  'dns'      => 8600,
  'http'     => 8500,
  'rpc'      => 8400,
  'serf_lan' => 8301,
  'serf_wan' => 8302,
  "server"   => 8300,
}

default[:consul][:config][:datacenter] = "dc1"
default[:consul][:config][:acl_datacenter] = node[:consul][:config][:datacenter]
default[:consul][:config][:ca_file] = "#{node[:consul][:config][:conf_dir]}/ssl/ca.crt"
default[:consul][:config][:cert_file] = "#{node[:consul][:config][:conf_dir]}/ssl/ssl.crt"
default[:consul][:config][:key_file] = "#{node[:consul][:config][:conf_dir]}/ssl/ssl.key"

default[:consul][:config][:data_dir] = "/var/lib/consul"
