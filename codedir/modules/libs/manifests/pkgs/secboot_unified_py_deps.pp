class libs::pkgs::secboot_unified_py_deps {
   package { 'unattended-upgrades': ensure => purged, provider => apt }
   $list = [
      'cert-to-efi-sig-list',
      'efibootmgr',
      'efi-readvar',
      'efi-updatevar',
      'gpg',
      'objcopy',
      'openssl',
      'pesign',
      'qemu-img',
      'sbsign',
      'sbverify',
      'sign-efi-sig-list',
      'yubico-piv-tool',
   ]
   package { $list:
      ensure => present,
      provider => apt,
   }
}
