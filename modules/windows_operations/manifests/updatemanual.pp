class windows_operations::updatemanual {
  
  # Set Windows Update (wuauserv) service to manual startup
  registry_key { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv':
    ensure => present,
  }
registry_value { 'Set Windows Update to manual':
    path    => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv\Start',
    type    => 'dword',
    data    => 2,
    require => Registry_key['HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv'],
  }
# Ensure the Windows Update service is stopped (optional)
  service { 'wuauserv':
    ensure => 'stopped',
    enable => false,
  }
}
