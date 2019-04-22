#Puppet file for ceph monitors
class ocf_ceph::monitor {
  require ocf_ceph
  $monitors = lookup('ceph::monitors')

  ocf::firewall::firewall46 {
    '101 allow ceph monitor communication':
      opts => {
        chain  => 'PUPPET-INPUT',
        proto  => 'tcp',
        source => concat($monitors, 'alamo'),
        action => 'accept',
        dport  => 6789,
      },
  }
}
