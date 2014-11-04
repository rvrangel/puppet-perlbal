$backend_servers = [
	'192.168.0.1:80',
	'192.168.0.2:80',
]

# using different port for management service
class {'perlbal':
	management_port = 50000,
}

# create a reverse proxy
perlbal::reverse_proxy {'website1':
	listen => '0.0.0.0:80',
	nodes => $backend_servers,
}
