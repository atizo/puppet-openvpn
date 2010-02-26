class openvpn::base { 
    package{'openvpn': 
        ensure => installed, 
    }
    # create an own module for this dependency"
    package{'openssl':
        ensure => installed,
    }
    service{'openvpn': 
        ensure => running, 
        enable => true, 
        hasstatus => true, 
        hasrestart => true, 
        require => Package['openvpn'],
    } 
    file{'/etc/openvpn/clients':
        ensure => directory,
        owner => root, group => 0, mode => 0755;
    }

}
