class libs::tunables::inotify {
   sysctl { 'kernel.perf_event_paranoid'   : value => '-1' }
   sysctl { 'fs.inotify.max_user_watches'  : value => '16777216' }
   sysctl { 'fs.inotify.max_user_instances': value => '1048576' }
}
