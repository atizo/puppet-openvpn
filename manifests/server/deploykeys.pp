define openvpn::server::deploykeys (
)
{
    # deploy key file
    file{"/etc/openvpn/keys/${name}":
        source => [
            "puppet://$server/modules/site-openvpn/${fqdn}/keys/${name}",
        ],
        owner => root, group => 0,
	require => File["/etc/openvpn/keys"]

    }

    if $name =~ /.*\.key$/{
        File["/etc/openvpn/keys/${name}"]{
	    mode => 0600,
        } 
    }
    else{
        File["/etc/openvpn/keys/${name}"]{
	    mode => 0644,
        } 
    }
}
