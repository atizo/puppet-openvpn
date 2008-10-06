# manifests/defines.pp

define openvpn::add_client_infos(
    $client_dir = '/etc/openvpn/clients',
    $client_tool = 'ifconfig-push',
    $ipaddress,
    $subnet = '255.255.255.0',
    $default_gw = 'absent'
){
    case $default_gw {
        'absent': { $gw_string = '' }
        default: { $gw_string = $default_gw }
    }
   file{"${client_dir}/${name}":
        content => "${client_too} ${ipaddress} ${subnet} ${gw_string}",
        require => File['/etc/openvpn/clients'],
        owner => root, group => 0, mode => 0644;
    } 
}