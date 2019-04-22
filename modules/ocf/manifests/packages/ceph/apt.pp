# Include ceph apt repo
class ocf::packages::ceph::apt {
  apt::key { 'ceph':
    ensure => refreshed,
    id     => '08B73419AC32B4E966C1A330E84AC2C0460F3994',
    server => 'pgp.ocf.berkeley.edu',
  }

  apt::source { 'ceph':
    location => 'https://download.ceph.com/debian-luminous/',
    repos    => 'main',
    require  => Apt::Key['ceph'],
  }
}
