# We want to use Hiera to create multiple user accounts under this class.
# 
define sftp::account (
  $username = $title, $password = '!', $shell = '/sbin/nologin', $manage_home = true,
  $home_dir = "/opt/sftp/$title", $create_group = true, $system = false, $uid = undef,
  $groups = [], $ensure = present,
  $comment= "$title Puppet-managed sftp User", $gid = 'sftpusers'

)
{
  user {
 	$title:
      	name       => $username,
      	comment    => $comment,
      	uid        => $uid,
      	password   => $password,
      	shell      => $shell,
      	gid        => $gid,
      	groups     => $groups,
      	home       => $home_dir,
      	managehome => $manage_home,
      	system     => $system,
  }
# The homedir has to be owned and only writeable by root.  Create it, and create an incoming directory where the user can store files
  file {
    	"${title}_home":
   	ensure  => directory,
      	path    => $home_dir,
      	owner   => 'root',
      	group   => $gid,
      	mode    => 0750;

	"${title}_incoming":
	ensure => directory,
	path => "${home_dir}/incoming",
	owner => $username,
	mode => 0750;

  }
# Create a cron job that runs under the user that clears content at 2AM daily
  cron {
	"${title}_clearcontent":
	command => "/bin/rm -rf ${home_dir}/incoming/*",
	user => $username,
	hour => 2,
	minute => 0,
  }


}
