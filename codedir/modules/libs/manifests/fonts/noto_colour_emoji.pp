define libs::fonts::noto_colour_emoji {
   $username = "${name}"
   $home_dir = "/home/${username}"

   file { ["${home_dir}/.fonts"]:
      ensure => directory
   } -> file { "${home_dir}/.fonts/NotoColorEmoji.ttf":
      ensure => file,
      mode   => "0644",
      owner  => $username,
      group  => $username,
      source => "puppet:///modules/libs_data/fonts/NotoColorEmoji.ttf",
   } ~> exec { "${username} fc-cache":
      command => "fc-cache -f -v",
      user        => $username,
      refreshonly => true,
      provider    => shell,
      logoutput   => true,
      timeout     => 10,
      tries       => 1,
   }
}
