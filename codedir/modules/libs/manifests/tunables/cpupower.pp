class libs::tunables::cpupower(
   String $governor,
   ) {
   exec { 'cpupower: governor':
      command   => "cpupower frequency-set --governor ${governor}",
      provider  => shell,
      logoutput => true,
      timeout   => 10,
      tries     => 1,
   }
}
