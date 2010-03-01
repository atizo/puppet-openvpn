define openvpn::server::config(
    $up_script = false,
    $uprestart_script = false,
    $downpre_script = false,
    $down_script = false
) {
    file{"/etc/openvpn/$name.conf":
        source => [
            "puppet://$server/modules/site-openvpn/$fqdn/$name.conf",
            "puppet://$server/modules/site-openvpn/$fqdn/server.conf",
        ],
        notify => Service['openvpn'],
        owner => root, group => 0, mode => 0644;
    }

    if $up_script {
        openvpn::server::script{"${name}-up.sh": 
	    ensure => 'present',
            require => File['/etc/openvpn/$name.conf'],
        }
    } else {
        openvpn::server::script{"${name}-up.sh": 
            ensure => 'absent',
	}
    }

    if $uprestart_script {
        openvpn::server::script{"${name}-up-restart.sh":
            ensure => 'present',
            require => File['/etc/openvpn/$name.conf'],
        }
    } else {
        openvpn::server::script{"${name}-up-restart.sh":
            ensure => 'absent',
	}
    }

    if $downpre_script {
        openvpn::server::script{"${name}-down-pre.sh":
            ensure => 'present',
            require => File['/etc/openvpn/$name.conf'],
        }
    } else {
        openvpn::server::script{"${name}-down-pre.sh":
            ensure => 'absent',
	}
    }

    if $down_script {
        openvpn::server::script{"${name}-down.sh":
            ensure => 'present',
            require => File['/etc/openvpn/$name.conf'],
        }
    } else {
        openvpn::server::script{"${name}-down.sh":
            ensure => 'absent',
	}
    }
}
