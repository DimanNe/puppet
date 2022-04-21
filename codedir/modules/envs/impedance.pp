$devel_dir = "\$HOME/devel"

warning("Devel dir: ${devel_dir}")

# include libs::git::pkg

# include libs::sys_users::dimanne
# class { libs::users::dimanne: devel_dir => $devel_dir, gits_to_clone = [] }
# include libs::sys_users::yulia
# class { libs::users::yulia: devel_dir => $devel_dir, gits_to_clone = [] }

# include libs::sudo::enroll_eligible_users

# warning(User <| tag == sudo |>)
# warning("gpg: ${::settings::environmentpath}/../modules/envs/files/puppet-release-4528B6CD9E61EF26.pub.gpg")

# class { libs::apt::sources_and_key:
#    # alternatively, we could put the files in puppet/codedir/modules/envs/files and specify absolute path as:
#    # "${::settings::environmentpath}/../modules/envs/files/puppet-release-4528B6CD9E61EF26.pub.gpg"
#    gpg_bin_key_path => "puppet:///modules/envs/puppet-release-4528B6CD9E61EF26.pub.gpg",
#    sources_path => "puppet:///modules/envs/puppet-apt.sources",
# }

# class { 'ntp':
#    servers => ['nist-time-server.eoni.com','nist1-lv.ustiming.org','ntp-nist.ldsbc.edu']
# }


class { 'limits':
  use_hiera => false,
  config => {
    '*' => {
      'nofile' => {
        soft => '16777216',
        hard => '16777216',
      }
    }
  },
}
