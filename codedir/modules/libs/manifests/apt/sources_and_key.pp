class libs::apt::sources_and_key(
   Stdlib::AbsolutePath sources_path,
   Stdlib::AbsolutePath gpg_bin_key_path,
) {
   $key_dir     = "/usr/share/keyrings/"
   $sources_dir = "/etc/apt/sources.list.d/"

   file { "$key_dir"    : ensure => directory }
   file { "$sources_dir": ensure => directory }

   file { Stdlib::basename(sources_path):
      mode => "0644",
      owner => 'root',
      group => 'root',
      source => $sources_path,
   }
   file { Stdlib::basename(gpg_bin_key_path):
      mode => "0644",
      owner => 'root',
      group => 'root',
      source => $gpg_bin_key_path,
   }
   # notify apt update
}
