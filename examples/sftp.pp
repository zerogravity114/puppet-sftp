# Tests have been moved to examples


# A hash of user resources, in production we would use Hiera and create a hash from that instead
include sftp

$testusers = {
  'john' => { password => 'password123', },
  'sally' => { password => 'password123', },
  'jlpicard' => { password => '$6$MA/E2ajU$hE2xkNYS3OrjJ1o3nuggim8IDcAdq/IOPP2JKak69Zsrfe39VXUoq0j.3.oJ356lvkT0g2jcZ.Kij.v2mk23F/', },

}

create_resources(sftp::account, $testusers)
	      
