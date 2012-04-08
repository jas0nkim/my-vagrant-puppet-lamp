class mysql {
  $mysqlpw = "1234"

  package { "mysql-server":
    ensure => present,
  }

  service { "mysql":
    enable => true,
    ensure => running,
    require => Package["mysql-server"],
  }

  exec { "set-mysql-passwrod":
    unless => "mysqladmin -uroot -p$mysqlpw status",
    command => "mysqladmin -uroot password $mysqlpw",
    require => Service["mysql"],
  }
}
