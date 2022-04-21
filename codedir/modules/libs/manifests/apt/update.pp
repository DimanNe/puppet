class libs::apt::update {
  exec { 'libs_apt_update':
    command     => "/usr/bin/apt-get update",
    logoutput   => true,
    refreshonly => true,
    tries       => 2,
    try_sleep   => 1
  }
}
