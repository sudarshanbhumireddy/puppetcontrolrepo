class windows_operations(

){

  
  Notify {'This is from windows_operations module and we are in init.pp':}

  exec { 'Run PowerShell Script2':
  command   => 'Write-Output "Hello from powershell"',
  provider  => powershell,
  logoutput => true,
}

  class {'windows_operations::fileoperations': }
  
  class {'windows_operations::packages_install':}
  
  class {'windows_operations::updatemanual':}

  class { 'windows_operations::service_test':
    service_name   => 'puppet',
    service_ensure => 'running',
  }
  Notify {'This is from windows_operations module and we are coming out of init.pp':}
}
