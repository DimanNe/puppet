class libs::multiseat::sound {
   # From https://rudd-o.com/linux-and-free-software/how-to-make-pulseaudio-run-once-at-boot-for-all-your-users
#    systemd::service { 'pulseaudio':
#       description  => 'PulseAudio system server',
#       type         => 'notify',
#       execstart    => "pulseaudio --daemonize=no --system --realtime --log-target=journal",
#       wantedby     => ['multi-user.target'],
#    }
   package {'pulseaudio':
      ensure => present,
      provider => apt,
   } -> file { '/etc/pulse/client.conf':
      ensure => file,
      mode   => "0644",
      owner  => 'root',
      group  => 'root',
      source => "puppet:///modules/libs_data/multiseat/pulse-client.conf",
   } -> User <| tag == pulse |> {
      groups +> "pulse-access" # Collect all virtual users with tag sudo and add "sudo" group to the list of groups
   } -> systemd::unit_file { 'pulseaudio.service':
      source => "puppet:///modules/libs_data/multiseat/pulseaudio.service",
   } ~> service {'pulseaudio':
      ensure => 'running',
   }
}
