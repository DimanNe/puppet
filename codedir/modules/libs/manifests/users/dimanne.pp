class libs::users::dimanne {
   $username = "dimanne"
   $home_dir = "/home/${username}"

   package { pulseaudio-utils: ensure => present, provider => apt } # needed for paplay
   file { ["${home_dir}/.config", "${home_dir}/.config/systemd", "${home_dir}/.config/systemd/user"]:
      ensure => directory
   } -> file { "${home_dir}/.config/systemd/user/silence.service":
      ensure => file,
      mode   => "0644",
      owner  => $username,
      group  => $username,
      source => "puppet:///modules/libs_data/users/silence.service",
   } -> file { "${home_dir}/.config/systemd/user/silence.sh":
      ensure => file,
      mode   => "0644",
      owner  => $username,
      group  => $username,
      source => "puppet:///modules/libs_data/users/silence.sh",
   } -> exec { 'enable silence.service':
      command => "systemctl --user enable silence.service && systemctl --user start silence.service",
      user      => $username,
      provider  => shell,
      logoutput => true,
      timeout   => 10,
      tries     => 1,
   }
}
