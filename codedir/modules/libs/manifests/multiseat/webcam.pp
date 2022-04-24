class libs::multiseat::webcam {
   $group_name = "video" # get it from getfacl /dev/video0

   group { $group_name:
      ensure => present,
   } -> User <| tag == webcam |> {
      groups +> $group_name # Collect all virtual users with tag sudo and add "sudo" group to the list of groups
   }
}
