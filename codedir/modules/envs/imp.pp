# $devel_dir = "\$HOME/devel"
# warning("Devel dir: ${devel_dir}")

include libs::sys_users::dimanne
include libs::sys_users::yulia
include libs::sudo::enroll_eligible_users

# include libs::multiseat::webcam
# include libs::multiseat::sound
# include libs::multiseat::u2f
# include libs::silence

# class { libs::users::dimanne: devel_dir => $devel_dir}
# class { libs::users::yulia: devel_dir => $devel_dir}

include libs::swap::disable

include libs::pkgs::gui
include libs::pkgs::cli
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
# class { libs::tunables::huge_pages: gib => 24 }
# class { libs::tunables::cpupower: governor => "performance" }
