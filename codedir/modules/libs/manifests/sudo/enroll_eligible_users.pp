class libs::sudo::enroll_eligible_users {
   class { 'sudo': }


   group { 'sudo': ensure => present, } # Should be created by class { 'sudo': } above, but just in case.
   sudo::conf { sudo_conf:
      priority => 50,
      content => '%sudo ALL=(ALL) ALL',
   }
   User <| tag == sudo |> { groups +> "sudo" } # Collect all virtual users with tag sudo and add "sudo" group to the list of groups


   group { 'no_pass_sudo': ensure => present, }
   sudo::conf { no_pass_sudo_conf:
      priority => 60,
      content => '%no_pass_sudo ALL=(ALL) NOPASSWD: ALL',
   }
   User <| tag == no_pass_sudo |> { groups +> "no_pass_sudo" }
}
