class tomcat{

package{"tomcat8":
  ensure => latest,
  before => File["/tmp/server.xml"]
}

file {"/tmp/server.xml":
  ensure => file,
  content => template('tomcat/server.xml.erb'),
  require => Package["tomcat8"],
  notify => Service["tomcat8"]
}
service{"tomcat8":
 ensure => running,
 subscribe => File["/tmp/server.xml"]
}

}
