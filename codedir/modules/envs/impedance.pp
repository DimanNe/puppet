# include libs::git::pkg
# include libs::sudo::enroll_eligible_users
# include libs::users::dimanne

# include stdlib

# warning(User <| tag == sudo |>)

# warning("gpg: ${::settings::environmentpath}/../modules/envs/files/puppet-release-4528B6CD9E61EF26.pub.gpg")

class { libs::apt::sources_and_key:
   # alternatively, we could put the files in puppet/codedir/modules/envs/files and specify absolute path as:
   # "${::settings::environmentpath}/../modules/envs/files/puppet-release-4528B6CD9E61EF26.pub.gpg"
   gpg_bin_key_path => "puppet:///modules/envs/puppet-release-4528B6CD9E61EF26.pub.gpg",
   sources_path => "puppet:///modules/envs/puppet-apt.sources",
}

# class { 'ntp':
#    servers => ['nist-time-server.eoni.com','nist1-lv.ustiming.org','ntp-nist.ldsbc.edu']
# }

