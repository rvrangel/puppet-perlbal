class perlbal (
	$enable = true,
	$user = 'www-data',
	$management_port = 16000,
	$management_host = '127.0.0.1',
	$package = $::osfamily ? {
		Debian => "perlbal",
		RedHat => "Perlbal",
	},	
	$mimetypes = undef,
) {
	package {'perlbal': 
		name => $package,
		ensure => installed,
	}

	file {'/etc/perlbal/services.d/':
		ensure => directory,
		require => Package['perlbal'],
	}
	
	file {'/etc/perlbal/pools.d/':
		ensure => directory,
		require => Package['perlbal'],
	}
	
	file {'/etc/perlbal/perlbal.conf':
		ensure => present,
		content => template('perlbal/perlbal.conf.erb'),
		require => Package['perlbal'],
		notify => Service['perlbal'],
	}

	augeas {'perlbal_config':
		context => '/files/etc/default/perlbal',
		changes => [
			"set PERLBAL_ENABLE $enable",
			"set USER $user",
		],
		notify => Service['perlbal'],
		require => Package['perlbal'],
       	}
	
	service {'perlbal':
		ensure => $enable,
		enable => $enable,
	}
}

