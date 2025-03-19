class windows_operations(

){

  
  Notify {'This is from windows_operations module and we are in init.pp':}
  class {'windows_operations::fileoperations': }
  
  
  class { 'windows_operations::service_test':
    service_name   => 'puppet',
    service_ensure => 'running',
  }
  Notify {'This is from windows_operations module and we are coming out of init.pp':}
}