class libs::apt::sources_and_key(
   Stdlib::AbsolutePath $sources_path,
   Stdlib::AbsolutePath $gpg_bin_key_path,
) {
   $key_dir     = "/usr/share/keyrings"
   $sources_dir = "/etc/apt/sources.list.d"

   $sources_basename     = ::basename($sources_path)
   $gpg_bin_key_basename = ::basename($gpg_bin_key_path)

   $sources_dst_path     = "${sources_dir}/${sources_basename}"
   $gpg_bin_key_dst_path = "${key_dir}/${gpg_bin_key_basename}"
   
   warning("${sources_path} new destination: ${sources_dst_path}")
   warning("${gpg_bin_key_path} new destination: ${gpg_bin_key_dst_path}")

#    file { "$key_dir"    : ensure => directory }
#    file { "$sources_dir": ensure => directory }
# 
#    file { Stdlib::basename(sources_path):
#       path => 
#       mode => "0644",
#       owner => 'root',
#       group => 'root',
#       source => $sources_path,
#    }
#    file { Stdlib::basename(gpg_bin_key_path):
#       mode => "0644",
#       owner => 'root',
#       group => 'root',
#       source => $gpg_bin_key_path,
#    }
   # notify apt update
}
