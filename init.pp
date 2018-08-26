class tomcat{

package {"tomcat7":
  ensure => installed,
  before => File["/tmp/server.xml"]
}
file{"/tmp/server.xml":
   ensure =>file,
   source => puppet:///extra_files/tomcat/files/server.xml,
   require =>Package["tomcat7"],
   notify =>Service["tomcat7"]
}
service{"tomcat7":
 ensure => running,
 subscribe => File["/tmp/server.xml"]
}

}

