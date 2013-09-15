# Hands-On Cookbook
A quick little cookbook that sets up an `autossh` upstart service that
connects to a remote host and sets up some SSH port forwards.  This is
used to provide a gateway to a remote host which is firewalled and
unable to accept or make connections which prevents it from connecting
to the VPN.

# Requirements
Only tested with Ubuntu 12.04 LTS.  As such, it requires the `autossh` package
to be available for installation and it only sets up an Upstart
service.

# Usage
You'll need to define the `node['hands-on']['key']` attribute which is
the private SSH key that can connect to the`node['hands-on']['tunnel_host']['hostname']` as
the`node['hands-on']['tunnel_host']['user']` user.

Then you'll want to define the port forwards in the `node['hands-on']['forwards']` array.

# Attributes
- `node['hands-on']['user']` -- this is the user account that the tunnel will run as
- `node['hands-on']['package']` -- the name of the `autossh` package
- `node['hands-on']['home']` -- the home directory of the `node['hands-on']['user']`
- `node['hands-on']['key']` -- the private SSH key that will be used for authentication
- `node['hands-on']['tunnel_host']['user']` -- the user to SSH as
- `node['hands-on']['tunnel_host']['hostname']'` -- the name of the machine to connect to
- `node['hands-on']['forwards']` -- an array of hashes containing the `local` and `remote` ports
  that the service should setup

# Recipes
- `default` -- creates an Upstart job that sets up the tunnel

# Author

Author:: Aaron D. Valade (<aaron@generalsensing.com>)
