class libs::users::dimanne {
   @user {'dimanne':
      ensure => present,
      tag    => [no_pass_sudo, docker],
   }
}
