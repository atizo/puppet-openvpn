define openvpn::server::key(
) {
    file{"/etc/openvpn/keys/$name":
        source => [
            "puppet://$server/modules/site-openvpn/keys/$name",
            "puppet://$server/modules/site-openvpn/$fqdn/keys/$name",
        ],
	require => File['/etc/openvpn/keys'],
        owner => root, group => 0;
    }
    if $name =~ /.*\.key$/ {
        File["/etc/openvpn/keys/$name"]{
	    mode => 0600,
        } 
    } else{
        File["/etc/openvpn/keys/$name"]{
	    mode => 0644,
        } 
    }
}
