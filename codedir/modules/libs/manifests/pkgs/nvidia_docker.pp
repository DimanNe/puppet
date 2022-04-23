class libs::pkgs::nvidia_docker {
   libs::apt::sources_and_key {'nvidia_docker':
      gpg_bin_key_path => "puppet:///modules/libs_data/pkgs/nvidia_cudatools.gpg",
      sources_path     => "puppet:///modules/libs_data/pkgs/nvidia_docker.sources",
   }

   package { ['nvidia-docker2', 'docker.io']:
      ensure => present,
      provider => apt,
      require => Libs::Apt::Sources_and_key[nvidia_docker]
   }

   User <| tag == docker |> { groups +> "docker" } # Collect all virtual users with tag sudo and add "sudo" group to the list of groups
}
