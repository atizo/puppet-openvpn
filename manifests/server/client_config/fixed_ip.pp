define openvpn::server::client_config::fixed_ip(
    $client_config_dir = '/etc/openvpn/clients',
    $subnet_mask = '255.255.255.0',
    $default_gateway,
    $client_ip
){
    if ! $default_gateway {
        $default_gateway = ''
    }
    file{"$client_config_dir/$name":
        content => "ifconfig-push $client_ip $subnet_mask $default_gateway",
        require => File['/etc/openvpn/clients'],
        owner => root, group => 0, mode => 0644;
    }
}
