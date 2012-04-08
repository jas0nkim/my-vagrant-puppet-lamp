class other {
  $packages = ["curl", "vim"]
  package { $packages:
    ensure => present,    
  }
}
