# default path
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

class lucid32 {
  package { "php5":
    ensure => present,
  }

  package { "libapache2-mod-php5":
    ensure => present,
  }
}

include bootstrap
include apache
include lucid32
