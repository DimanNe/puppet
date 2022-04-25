class libs::pkgs::kubernetes {
   libs::apt::sources_and_key {'kubernetes':
      gpg_bin_key_path => "puppet:///modules/libs_data/pkgs/google-cloud-rapture.gpg",
      sources_path     => "puppet:///modules/libs_data/pkgs/google-kubernetes.sources",
   }

   package { ['kubectl']:
      ensure => present,
      provider => apt,
      require => Libs::Apt::Sources_and_key[kubernetes]
   }
}
