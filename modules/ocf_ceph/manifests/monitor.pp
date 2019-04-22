#Puppet file for ceph monitors
class ocf_ceph::monitor {
  require ocf_ceph
  $monitors = lookup('ceph::monitors')

  firewall_multi {
    '101 allow ceph monitor communication':
      chain  => 'PUPPET-INPUT',
      source => concat($monitors, 'alamo'),
      proto  => 'tcp',
      action => 'accept',
      dport  => 6789,
  }
}
