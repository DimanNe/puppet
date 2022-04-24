class libs::swap::disable {
   exec { 'run swapoff':
      command     => "/usr/sbin/swapoff -a",
      logoutput   => true,
      tries       => 1,
   }

   exec { 'comment swap entries in fstab':
      #                                         /dev/... none    swap ...
      command     => "/usr/bin/sed -i -E '/^\s*\\/[^ ]+\s+[^ ]+\s+swap\s+[^ ]+.*$/s/^/### (commented by puppet): ### /g' /etc/fstab", # https://gist.github.com/haisum/4fcd9146b6c972d0d3ca
      logoutput   => true,
      tries       => 1,
   }

   exec { 'disable systemd swap units':
      command => "systemctl --all --type swap | grep -P '^[^\\s]+\\s+[^\\s]+\\s+[^\\s]+$' | xargs -I {} bash -c \"systemctl stop '{}'; systemctl mask '{}'\" || true",
      logoutput => true,
      provider => shell,
   }
}
