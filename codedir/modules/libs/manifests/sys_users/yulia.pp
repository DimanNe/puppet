class libs::sys_users::yulia {
   @user {'yulia':
      ensure => present,
      tag    => [sudo, docker, u2f, webcam, pulse],
   }
}
