define libs::apt::sources_and_key(
   String $sources_path,
   String $gpg_bin_key_path,
) {
   $key_dir     = "/usr/share/keyrings"
   $sources_dir = "/etc/apt/sources.list.d"

   $sources_dst_path     = extlib::path_join([$sources_dir, ::basename($sources_path)]) # "${sources_dir}/${sources_basename}"
   $gpg_bin_key_dst_path = extlib::path_join([$key_dir, ::basename($gpg_bin_key_path)]) # "${key_dir}/${gpg_bin_key_basename}"

   warning("Source file: ${sources_path} new destination: ${sources_dst_path}")
   warning("Gpg key: ${gpg_bin_key_path} new destination: ${gpg_bin_key_dst_path}")

   require ::libs::apt::ctor
   include ::libs::apt::update

   file { $gpg_bin_key_dst_path:
      mode => "0644",
      owner => 'root',
      group => 'root',
      source => $gpg_bin_key_path,
   }
   file { $sources_dst_path:
      mode => "0644",
      owner => 'root',
      group => 'root',
      source => $sources_path,
      notify => Class['libs::apt::update'],
      require => File[$gpg_bin_key_dst_path],
   }
}
