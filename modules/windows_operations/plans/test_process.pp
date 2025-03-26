plan windows_operations::test_process() {
  # Note that if you tried to use `localhost` instead of `my-primary-server` this plan would fail!
  run_task('get_processinfo', 
    name   => 'explorer'
  )
}
