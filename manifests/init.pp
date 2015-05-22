# Plan of action for the module:
# 1. We will be using OpenSSH with a chroot jail that places users in /opt/sftp/username
# 2. Install Openssh, configure it to allow port mapping so connected users can connect to sftp
# 3. Create user accounts for sftpd.  Manage their home directory, and password (sftpd::users)
# 4. Create and enforce a cron job for each sftp user that clears their content once per day (1AM) 
# 4a. Should we wrap this into ::users?  Doesn't need to be a perfect module, just has to work
# 5. Make sure all of this can be set up via 1 command, use a examples/sftp.pp
# 5a. Is it even possible to say puppet sftp.pp or should it be 'puppet apply tests/sftp.pp'
# 6. That's all
class sftp {

	case $::osfamily {
		'RedHat': {include sftp::redhat}
		default: { notify { "Class[sftpd] does not support $::osfamily": } }
	}

	group { 'sftpusers':
        	ensure => present,
        	name   => 'sftpusers',
    	}



}

