define openvpn::server::startup(
  $startup_script = false,
  $shutdown_script = false
) {
  if $startup_script {
    file{"/etc/openvpn/openvpn-startup":
      source => [
        "puppet://$server/modules/site-openvpn/$fqdn/openvpn-startup",
      ],
      ensure => 'present',
      owner => root, group => 0, mode => 0755,
      notify => Service['openvpn'];
    }
  } else {
    file{"/etc/openvpn/openvpn-startup":
      ensure => 'absent',
      notify => Service['openvpn'];
    }
  }
  if $shutdown_script {
    file{"/etc/openvpn/openvpn-shutdown":
      source => [
        "puppet://$server/modules/site-openvpn/$fqdn/openvpn-shutdown",
      ],
      ensure => 'present',
      owner => root, group => 0, mode => 0755,
      notify => Service['openvpn'];
    }
  } else {
    file{"/etc/openvpn/openvpn-shutdown":
      ensure => 'absent',
      notify => Service['openvpn'];
    }
  }
}
