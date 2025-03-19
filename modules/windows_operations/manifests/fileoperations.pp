class windows_operations::fileoperations(

) {

# Ensure that the 'C:\test' directory exists
file { 'C:\test':
  ensure => directory,
}

# Ensure that the 'C:\test\sample.txt' file exists with specified content 
file { 'C:\test\sample.txt':
  ensure  => file,
  content => "This is a sample Puppet managed file on Windows.\n",
}


file { 'C:\test\sampledir':
  ensure => file,
} 


exec { 'Run PowerShell Script':
  command   => 'Write-Output "Hello from powershell"',
  provider  => powershell,
  logoutput => true,
}

 file { 'C:\ProgramData\puppetlabs\puppet\files\sample.ps1':
    ensure  => file,
    content => template('windows_operations/sample.ps1.erb'),
  } 

exec { 'Run PowerShell Script from sample file':
  command   => 'powershell.exe -ExecutionPolicy Bypass -File C:\ProgramData\puppetlabs\puppet\files\sample.ps1',
  provider  => powershell,
  logoutput => true,
}



}

