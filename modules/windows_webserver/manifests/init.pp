# windows_webserver/manifests/init.pp
class windows_webserver {

  # Install IIS (Internet Information Services)
  windowsfeature { 'Web-Server':
    ensure => present,
  }

  # Ensure the default website is running
  service { 'W3SVC':
    ensure  => running,
    require => Windowsfeature['Web-Server'],
  }

  # Create a basic index.html file
  file { 'C:\inetpub\wwwroot\index.html':
    ensure  => present,
    content => "<html><body><h1>Hello from Puppet on Windows!</h1></body></html>",
    require => Service['W3SVC'],
  }

  # Open port 80 in the Windows Firewall for HTTP traffic
  exec { 'open_firewall_port_80':
    command => 'netsh advfirewall firewall add rule name="HTTP Port 80" dir=in action=allow protocol=TCP localport=80',
    unless  => 'netsh advfirewall firewall show rule name="HTTP Port 80" | findstr "Allow"',
    require => Service['W3SVC'],
  }
}
