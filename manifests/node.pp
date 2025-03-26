node 'desktop-4mtampd.localdomain' {
    include windows_operations
    class { 'python':
      version => 'system',
      dev     => true,
    }

}
