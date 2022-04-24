class libs::multiseat::u2f {
   $group_name = "seckey_users"

   group { $group_name:
      ensure => present,
   } -> User <| tag == u2f |> {
      groups +> $group_name # Collect all virtual users with tag sudo and add "sudo" group to the list of groups
   } -> systemd::udev::rule { '99-u2f-key-perm.rules':
      ensure => present,
      path   => "/etc/udev/rules.d",
      notify => Service["systemd-udevd"],
      rules  => [
         # Titan
         'SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1050", ATTRS{idProduct}=="0121", ACTION=="add", GROUP="seckey_users" SYMLINK+="myusbkey"',
         # Yubikey (Copy from /lib/udev/rules.d/70-u2f.rules)
         'SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1050", ATTRS{idProduct}=="0113|0114|0115|0116|0120|0200|0402|0403|0406|0407|0410", ACTION=="add", GROUP="seckey_users" SYMLINK+="myusbkey"',
      ]
   }
}
