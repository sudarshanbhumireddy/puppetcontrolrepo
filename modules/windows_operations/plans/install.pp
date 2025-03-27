  plan windows_operations::install (
  TargetSpec $nodes,
  String $package_name = 'git'
  )# Install package using Chocolatey
  {
    run_task('package', $nodes, 
      name   => $package_name,
      action => 'install',
      provider => 'chocolatey'
    )
  }
