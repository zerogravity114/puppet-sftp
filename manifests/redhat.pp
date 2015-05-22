class sftp::redhat {
  package { 'openssh-server':
	ensure => installed,
	before => File['/etc/ssh/sshd_config'],
  }

  file { '/etc/ssh/sshd_config':
	ensure => file,
	owner => 'root',
	mode => '0600',
	source => 'puppet:///modules/sftp/redhat/sshd_config',
  }

  file { '/opt/sftp':
	ensure => directory,
	owner => 'root',
	mode  => '0755',
  }

  service { 'sshd':
	ensure => running,
	enable => true,
	subscribe => File['/etc/ssh/sshd_config'],
  }

}

