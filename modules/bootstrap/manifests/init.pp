class bootstrap { 
  # this makes puppet and vagrant shut up about the puppet group
  group { 'puppet':
    ensure => 'present'
  }

  # make sure the packages are up to date before beginning
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }
}
