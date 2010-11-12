class openvpn::server { 
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
  file{ [ '/etc/openvpn/clients',
          '/etc/openvpn/keys',
          '/var/log/openvpn', ]:
    ensure => directory,
    require => Package['openvpn'],
    owner => root, group => 0, mode => 0755;
  }
}
