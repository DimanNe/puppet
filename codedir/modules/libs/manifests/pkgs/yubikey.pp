class libs::pkgs::yubikey(
    Boolean $luks,
    Boolean $sudo_u2f,
    Boolean $sudo_challenge_response,
    Boolean $smartcard,
    Boolean $other,
) {
   if $luks == true {
      package { ['yubikey-luks', 'yubikey-personalization']: ensure => present, provider => apt }
   }
   if $sudo_u2f == true {
      package { ['libpam-u2f', 'pamu2fcfg']: ensure => present, provider => apt }
   }
   if $sudo_challenge_response == true {
      package { ['yubikey-personalization', 'libpam-yubico']: ensure => present, provider => apt }
   }
   if $smartcard == true {
      package { ['libnfc-bin', 'pcsc-tools', 'scdaemon']: ensure => present, provider => apt }
   }
   if $other == true {
      package { ['yubikey-manager', 'yubikey-personalization-gui']: ensure => present, provider => apt }
   }
}
