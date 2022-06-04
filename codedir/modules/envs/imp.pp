class { 'systemd': # Needed by libs::multiseat::u2f which adds udev::rule
  manage_resolved          => false,
  manage_resolv_conf       => false,
  manage_networkd          => false,
  manage_timesyncd         => false,
  manage_accounting        => false,
  manage_journald          => false,
  manage_udevd             => true,
  manage_logind            => false,
  manage_all_network_files => false,
  manage_coredump          => false,
}

include libs::sys_users::dimanne
include libs::sys_users::yulia
include libs::sudo::enroll_eligible_users
include libs::users::dimanne
include libs::users::yulia

include libs::multiseat::sound
include libs::multiseat::webcam
include libs::multiseat::u2f

include libs::swap::disable

include libs::pkgs::gui
include libs::pkgs::cli
include libs::pkgs::kubernetes
include libs::pkgs::helm
include libs::pkgs::build_py_deps
include libs::pkgs::nvidia_docker
include libs::pkgs::secboot_unified_py_deps
class { libs::pkgs::chrome: stable => true, beta => true }
class { libs::pkgs::yubikey:
    luks => true,
    sudo_u2f => true,
    sudo_challenge_response => false,
    smartcard => true,
    other => false
}

include libs::tunables::nofile
include libs::tunables::inotify
class { libs::tunables::huge_pages: gib => 12 }
class { libs::tunables::cpupower: governor => "performance" }



# sudo -i puppet config set --section main daemonize false &&
# sudo -i puppet config set --section main onetime true
