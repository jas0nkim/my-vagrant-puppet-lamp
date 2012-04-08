class php::pear {
  include php

  # upgrade PEAR
  exec { "pear upgrade":
    require => Package["php-pear"]
  }
}
