plan windows_operations::referencing_the_primary_server(){
  # Note that if you tried to use `localhost` instead of `my-primary-server` this plan would fail!
  run_command(‘whoami’, ‘desktop-4mtampd.localdomain’)
}
