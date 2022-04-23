class libs::apt::ctor {
   $key_dir     = "/usr/share/keyrings"
   $sources_dir = "/etc/apt/sources.list.d"
   file { $key_dir    : ensure => directory }
   file { $sources_dir: ensure => directory }
}
