# puppet-sftp
A Puppet module that configures an sftp server using OpenSSH.  Places accounts in a chroot jail.  Schedules a cron job to clear user content once a week.  User accounts can be created using a hiera hash.  Examples/sftp.pp creates some users and shows you how to use the module.
