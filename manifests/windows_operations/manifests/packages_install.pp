class windows_operations::packages_install(

) {

  #reboot { 'before': 
  #  when            => pending,
  #}
class {'chocolatey':
  log_output              => true,
}

# Ensure that the 'notepad++' package is installed
  package { 'dotnet-8.0-desktopruntime':
    ensure => installed,
    provider => 'chocolatey',
  }
 
  package { '7zip':
    ensure   => latest,
    provider => 'chocolatey',
  }
    
}

