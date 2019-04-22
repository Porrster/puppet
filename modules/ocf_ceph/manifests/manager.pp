#Puppet file for ceph managers
class ocf_ceph::manager {
  require ocf_ceph
  $managers = lookup('ceph::managers')

  firewall_multi {
  '101 allow ceph manager communication':
    chain    => 'PUPPET-INPUT',
      source => $managers,
      proto  => 'tcp',
      action => 'accept',
      dport  => '6800-7300',
  }
}
