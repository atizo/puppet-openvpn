define openvpn::deployscript (
    ensure = 'present'
)
{
    # deploy script
    if $ensure == 'present' {
        file{"/etc/openvpn/${name}":
            source => [
                "puppet://$server/modules/site-openvpn/${fqdn}/${name}",
            ],
            owner => root, group => 0, mode => 0644,
	    ensure => present,
        }
    } 

    # remove script
    if $ensure == 'absent' {
        file{"/etc/openvpn/${name}":
        ensure => absent,
    	}
    }

}
