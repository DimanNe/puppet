class libs::tunables::nofile {
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
}
