class windows_operations::registry_settings(
  
  String $registry_path = 'Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced',
  String $value_name    = 'TaskbarSmallIcons', 
  String $value_type    = 'DWord',
  String $value_data    = '1'
) 
{

  # Ensure the directory exists
  file { 'C:\\ProgramData\\puppetlabs\\puppet\\files':
    ensure => directory,
    recurse => true,
  }

  file { 'C:\\ProgramData\\puppetlabs\\puppet\\files\\set_registry_value.ps1':
    ensure  => file,
    content => template('windows_operations/set_registry_value.ps1.erb'),
  }
  
   # $script_content = template('windows_operations/GetRegistryPath.ps1.erb')

    #file { 'C:/GetRegistryPath.ps1':
    #    ensure  => file,
    #    content => $script_content,
    #}

    #exec { 'run_powershell_script':
    #    command   => 'powershell.exe -NoProfile -ExecutionPolicy Bypass -File C:/#   GetRegistryPath.ps1 -searchTerm "WinSCP"',
    #    provider  => powershell,
    #    logoutput => true,
    #    require   => File['C:/GetRegistryPath.ps1'],
    #}
    
  exec { 'Set Taskbarsmallicons':
    command   => "powershell.exe -ExecutionPolicy Bypass -File C:\\ProgramData\\puppetlabs\\puppet\\files\\set_registry_value.ps1 -RegistryPath '${registry_path}' -ValueName '${value_name}' -ValueType '${value_type}' -ValueData '${value_data}'",
    provider  => powershell,
    logoutput => true,
    #unless    => "if((Get-ItemProperty -Path 'HKCU:\\${registry_path}' -Name '${value_name}').${value_name} -eq ${value_data})  { exit 0 } else { exit 1 }",
    require   => File['C:\\ProgramData\\puppetlabs\\puppet\\files\\set_registry_value.ps1'], 
  }
  # Ensure the network drive is mapped in the registry for the current user
  #registry_key { "HKEY_CURRENT_USER\\Network\\a":
  #  ensure => present, 
  #}

  # registry_value { "HKEY_CURRENT_USER\\Network\\b\\RemotePath":
  #   ensure  => present,
  #   type    => string,
  #   data    => $network_path,
  #   require => Registry_key["HKEY_CURRENT_USER\\Network\\b"],
  # }

  # registry_value { "HKEY_CURRENT_USER\\Network\\c\\ProviderName":
  #   ensure  => present,
  #   type    => string,
  #   data    => $network_path,
  #   require => Registry_key["HKEY_CURRENT_USER\\Network\\c"],
  # }

  # Optionally, configure other settings like the drive type
  #registry_value { "HKEY_CURRENT_USER\\Network\\d\\ConnectionType":
  #  ensure  => present,
  #  type    => dword,
  #  data    => 1, # 1 for network drive, 0 for disconnected drive
  #  require => Registry_key["HKEY_CURRENT_USER\\Network\\d"],
  #}
}

