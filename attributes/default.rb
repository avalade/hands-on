default['hands-on']['user'] = 'tunnel'
default['hands-on']['package'] = 'autossh'

default['hands-on']['home'] = '/home/tunnel'
default['hands-on']['key'] = 'DEADBEEF' # the ssh key to use

# The user account on the remote machine the tunnel is connected to
default['hands-on']['tunnel_host']['user'] = 'tunnel'

# The hostname of the remote machine to connect to
default['hands-on']['tunnel_host']['hostname'] = 'somewhere.over.the.rainbow'

# Should be an array of hashes containing a :local and :remote
default['hands-on']['forwards'] = []
