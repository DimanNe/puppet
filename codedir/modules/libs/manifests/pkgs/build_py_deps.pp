class libs::pkgs::build_py_deps {
   $list = ['python3-docker', 'python3-pexpect']
   package { $list:
      ensure => present,
      provider => apt,
   }
}
