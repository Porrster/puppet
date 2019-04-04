#Puppet file for ceph monitors
class ocf_ceph::monitor {
  $monitors = lookup('ceph::monitors')
  firewall_multi {
    '101 allow ceph monitor communication':
      chain  => 'PUPPET-INPUT',
      source => $monitors,
      proto  => 'tcp',
      action => 'accept',
      dport  => 6789,
  }
}
