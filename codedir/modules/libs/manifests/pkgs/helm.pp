class libs::pkgs::helm {
   libs::apt::sources_and_key {'helm':
      gpg_bin_key_path => "puppet:///modules/libs_data/pkgs/balto-helm.gpg",
      sources_path     => "puppet:///modules/libs_data/pkgs/balto-helm.sources",
   }

   package { ['helm']:
      ensure => present,
      provider => apt,
      require => Libs::Apt::Sources_and_key[helm]
   }
}
