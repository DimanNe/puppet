class libs::pkgs::secboot_unified_py_deps {
   package { 'unattended-upgrades': ensure => purged, provider => apt }
   $list = [
      'binutils',
      'efibootmgr',
      'efitools',
      'openssl',
      'pesign',
      'qemu-utils',
      'sbsigntool',
      'yubico-piv-tool',
   ]
   package { $list:
      ensure => present,
      provider => apt,
   }
}
