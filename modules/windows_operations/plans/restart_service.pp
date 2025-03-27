plan windows_operations::restart_service (
  TargetSpec $nodes,
  String $service_name = 'wuauserv'
) {


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
