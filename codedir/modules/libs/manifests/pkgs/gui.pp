class libs::pkgs::gui {
   $list = ['filelight', 'kdiff3', 'kompare', 'krusader']
   package { $list:
      ensure => present,
      provider => apt,
   }
}
