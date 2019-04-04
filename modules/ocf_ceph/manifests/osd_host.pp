#Puppet file for ceph nodes hosting storage
class ocf_ceph::osd_host {
  $osd_hosts = lookup('ceph::osd_hosts')
  firewall_multi {
    '101 allow ceph manager communication':
      chain  => 'PUPPET-INPUT',
      source => $osd_hosts,
      proto  => 'tcp',
      action => 'accept',
      dport  => '6800-7300',
  }
}
