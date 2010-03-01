define openvpn::server::script(
    $ensure = 'absent'
) {
    file{"/etc/openvpn/$name":
        source => "puppet://$server/modules/site-openvpn/$fqdn/$name",
        ensure => $ensure,
        owner => root, group => 0, mode => 0644;
    }
}
