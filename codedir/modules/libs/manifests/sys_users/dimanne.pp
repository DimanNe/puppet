class libs::sys_users::dimanne {
   @user {'dimanne':
      ensure => present,
      tag    => [sudo, docker],
   }
}
