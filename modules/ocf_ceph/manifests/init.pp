class ocf_ceph {
  include ocf::packages::ceph
  # ocfceph user needs passwordless sudo access
  file { '/etc/sudoers.d/ocfceph':
    content => 'ocfceph ALL=NOPASSWD: ALL',
  }
}
