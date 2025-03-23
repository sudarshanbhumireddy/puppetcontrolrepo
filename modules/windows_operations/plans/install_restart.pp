plan windows_operations::install_restart (
  TargetSpec $nodes,
  String $package_name = 'Notepad++',
  String $service_name = 'wuauserv'
) {
  # Install package using Chocolatey
  run_task('package', $nodes, 
    name   => $package_name,
    action => 'install',
    provider => 'chocolatey'
  )

  # Restart the specified service
  run_task('service', $nodes, 
    name   => $service_name,
    action => 'restart'
  )

  # Verify service status
  run_task('service', $nodes, 
    name   => $service_name,
    action => 'status'
  )
}
