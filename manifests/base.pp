class openvpn::base { 
    package{'openvpn': 
        ensure => installed, 
    } 
    service{'openvpn': 
        ensure => running, 
        enable => true, 
        hasstatus => true, 
        hasrestart => true, 
        require => Package['openvpn'],
    } 
}
