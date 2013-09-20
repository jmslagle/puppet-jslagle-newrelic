# == Class newrelic::intall
# This class is meant to be called from newrelic
# It install requires packages
class newrelic::install {

  $source = $newrelic::java_agent_source
  $version = $newrelic::java_agent_version
  $install = $newrelic::java_agent_install

  Exec {
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ]
  }

  file { 'newrelic-dir':
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => "0755",
    path   => $install,
  }

  exec { 'download-newrelic':
    command => "wget ${source}/${version}/newrelic-agent${version}.zip",
    cwd     => $install,
    creates => "${install}/newrelic-agent${version}.zip",
  }


  exec { 'unzip-newrelic':
    command => "unzip newrelic-agent${version}.zip",
    cwd     => $install,
    creates => "${install}/newrelic",
  }

}