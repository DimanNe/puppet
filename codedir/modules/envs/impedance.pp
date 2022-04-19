# include libs::git::pkg
# include libs::sudo::enroll_eligible_users
# include libs::users::dimanne

# include stdlib

# warning(User <| tag == sudo |>)

class { libs::apt::sources_and_key:
   gpg_bin_key_path => "/home/dimanne/devel/puppet/puppet-release-4528B6CD9E61EF26.pub.gpg",
   sources_path => "/home/dimanne/devel/puppet/puppet-apt.sources",
}

# class { 'ntp':
#    servers => ['nist-time-server.eoni.com','nist1-lv.ustiming.org','ntp-nist.ldsbc.edu']
# }

