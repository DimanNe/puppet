class libs::sys_users::yulia {
   @user {'yulia':
      ensure => present,
      tag    => [sudo, docker],
   }
}
