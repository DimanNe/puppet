$devel_dir = "\$HOME/devel"
warning("Devel dir: ${devel_dir}")

include libs::sys_users::dimanne
include libs::sys_users::yulia
include libs::sudo::enroll_eligible_users

# class { libs::users::dimanne: devel_dir => $devel_dir}
# class { libs::users::yulia: devel_dir => $devel_dir}

# class { libs::apt::sources_and_key:
#    # alternatively, we could put the files in puppet/codedir/modules/envs/files and specify absolute path as:
#    # "${::settings::environmentpath}/../modules/envs/files/puppet-release-4528B6CD9E61EF26.pub.gpg"
#    gpg_bin_key_path => "puppet:///modules/envs/puppet-release-4528B6CD9E61EF26.pub.gpg",
#    sources_path => "puppet:///modules/envs/puppet-apt.sources",
# }

include libs::swap::disable

include libs::pkgs::gui
include libs::pkgs::cli
include libs::pkgs::chrome
include libs::pkgs::chrome_beta
include libs::pkgs::build_py_deps
include libs::pkgs::secboot_unified_py_deps
include libs::pkgs::yu_luks
include libs::pkgs::yu_sudo
include libs::pkgs::yu_smart
include libs::pkgs::yu_other

include libs::tunables::nofile
include libs::tunables::inotify
class { libs::tunables::pages_1G: n     => 24 }
class { libs::tunables::governor: value => "performance" }
