class libs::pkgs::cli {
   $list = ['git', 'curl', 'apt-file', 'bat', 'htop', 'iftop', 'iotop', 'nmap', 'ppa-purge', 'qrencode']
   package { $list:
      ensure => present,
      provider => apt,
   }
}
