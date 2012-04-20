class other {
  $packages = ["curl", "vim"]
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
