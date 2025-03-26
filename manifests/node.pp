node 'desktop-4mtampd.localdomain' {
    include windows_operations
    Notify{ 'hello from server2': }
    file { 'C:\test':
      ensure => directory,
    }

}
