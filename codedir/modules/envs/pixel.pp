include libs::pkgs::gui
include libs::pkgs::cli
include libs::pkgs::build_py_deps
include libs::pkgs::nvidia_docker
class { libs::pkgs::chrome: stable => true, beta => true }
include libs::tunables::nofile
include libs::tunables::inotify
