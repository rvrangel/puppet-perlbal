define perlbal::webserver (
	$listen,
	$enable = true,
	$dirindexing = false,
	$docroot,
	$enable_concatenate_get = true,
	$enable_md5 = true,
	$enable_delete = false,
	$enable_put = false,
	$index_files = 'index.html',
	$max_put_size = 0,
	$min_put_directory = 0,
	$server_tokens = true,
) {
	
	include perlbal
	
	file {"/etc/perlbal/services.d/$name.conf":
		ensure => present,
		content => template('perlbal/webserver.conf.erb'),
		notify => Service['perlbal']
	}

	
	
}

