puppet-perlbal
==============

Puppet module for managing the Perlbal HTTP Load Balancer http://danga.com/perlbal/


##Example: 

```puppet
# will handle package installation and initial configuration
class {'perlbal':}

# configure a reverse proxy
perlbal::reverse_proxy {'website1':
	listen => '0.0.0.0:80',
	nodes =>  [ '192.168.0.1:80', '192.168.0.2:80' ],
}
```
