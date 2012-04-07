class apache {
  package { "apache2":
    ensure => present,
  }

  # starts the apache2 service once the packages installed, and monitors changes to its configuration files and reloads if nesessary
  service { "apache2":
    ensure => running,
    enable => true,
    require => Package["apache2"],
    subscribe => [
      File["/etc/apache2/mods-enabled/rewrite.load"],
      File["/etc/apache2/sites-available/vagrant_webroot"]
    ],
  }

  # ensures that mode_rewrite is loaded and modifies the default configuration file
  file { "/etc/apache2/mods-enabled/rewrite.load":
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package["apache2"],
  }

  file { "/etc/apache2/sites-available/vagrant_webroot":
    ensure => present,
    source => "/vagrant/manifests/vagrant_webroot",
  }

  file { "/etc/apache2/sites-enabled/vagrant_webroot":
    ensure => link,
    target => "/etc/apache2/sites-available/vagrant_webroot",
    require => Package["apache2"],
  }


}
