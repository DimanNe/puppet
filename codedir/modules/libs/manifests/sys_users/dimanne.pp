class libs::sys_users::dimanne {
   @user {'dimanne':
      ensure => present,
      tag    => [no_pass_sudo, docker, u2f, webcam],
   }
}
