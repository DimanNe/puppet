class libs::tunables::huge_pages(
   Integer $gib = 0,
   ) {
   exec { 'huge_pages: gib':
      command   => "echo ${gib} > /sys/kernel/mm/hugepages/hugepages-1048576kB/nr_hugepages",
      provider  => shell,
      logoutput => true,
      timeout   => 120,
      tries     => 10,
      try_sleep => 1,
   }
}
