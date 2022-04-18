include libs::git::pkg
include libs::sudo::enroll_eligible_users
include libs::users::dimanne

# warning(User <| tag == sudo |>)


# class { 'ntp':
#    servers => ['nist-time-server.eoni.com','nist1-lv.ustiming.org','ntp-nist.ldsbc.edu']
# }

