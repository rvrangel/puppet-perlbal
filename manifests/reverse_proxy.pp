define perlbal::reverse_proxy (
	$listen,
	$enable = true,
	$persist_client = true,
	$persist_backend = true,
	$verify_backend = true,
	$idle_timeout = 30,
	$backend_persist_cache = 2,
	$connect_ahead = 2,
	$persist_client_idle_timeout = 30,
	$nodes,
) {
	
	include perlbal
	
	file {"/etc/perlbal/pools.d/$name.dat":
		ensure => present,
		content => template('perlbal/nodelist.dat.erb'),
	}
	->
	file {"/etc/perlbal/services.d/$name.conf":
		ensure => present,
		content => template('perlbal/reverse_proxy.conf.erb'),
		notify => Service['perlbal']
	}

	
	
}

