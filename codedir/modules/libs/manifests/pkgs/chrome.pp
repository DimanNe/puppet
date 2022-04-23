class libs::pkgs::chrome(
    Boolean $stable,
    Boolean $beta,
) {

   # Remove duplicate source files provided setup by chrome:
   file { '/etc/apt/sources.list.d/google-chrome.list'     : ensure => absent }
   file { '/etc/apt/sources.list.d/google-chrome-beta.list': ensure => absent }

   libs::apt::sources_and_key {'google-chrome':
      # alternatively, we could put the files in puppet/codedir/modules/envs/files and specify absolute path as:
      # "${::settings::environmentpath}/../modules/envs/files/puppet-release-4528B6CD9E61EF26.pub.gpg"
      gpg_bin_key_path => "puppet:///modules/libs_data/pkgs/google-Linux-Packages-Signing-Authority.pub.gpg",
      sources_path     => "puppet:///modules/libs_data/pkgs/google-chrome.sources",
   }

   if $stable == true {
      package { google-chrome-stable: ensure => present, provider => apt, require => Libs::Apt::Sources_and_key['google-chrome'] }
   }
   if $beta == true {
      package { google-chrome-beta: ensure => present, provider => apt, require => Libs::Apt::Sources_and_key['google-chrome'] }
   }
}
