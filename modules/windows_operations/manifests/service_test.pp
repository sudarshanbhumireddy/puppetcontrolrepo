class windows_operations::service_test(
  
  String $service_name,
  String $service_ensure,
){
  notify { "Module1 File Operations: param1 is ${service_name}, param2 is ${service_ensure}": }
  service { "${service_name}":
    ensure     => "${service_ensure}",
    enable     => true,
    hasrestart => true,
  }


}

