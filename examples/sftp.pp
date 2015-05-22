# Tests have been moved to examples

# include our sftp module
include sftp

# Create a hash of user resources and use the sftp::acount type to generate the user accounts.  In production we will use hiera to generate this hash
# user passwords: jlpicard/ncc1701d \ john/Hello$! \ sally/Hunter45^
$testusers = {
  'john' => { password => '$6$tZQgOnyH$YD0dF6VKGMPLmAoD9NPeY54LYHcUc2c0zx5JO0wzqYF7afVP/kVzgaSQY9uKajhUeeIGMpG85.URbTanwfQf./', },
  'sally' => { password => '$6$ZpCPhUbN$E.mRhQLIk.mqgfDBCe4ZtDn8KpVrotAYwmJBzFImYi.IZ8jAxebHMCwnjMhbgDYl/CRkFrJtnKULGj/lqljb.0', },
  'jlpicard' => { password => '$6$MA/E2ajU$hE2xkNYS3OrjJ1o3nuggim8IDcAdq/IOPP2JKak69Zsrfe39VXUoq0j.3.oJ356lvkT0g2jcZ.Kij.v2mk23F/', },

}

create_resources(sftp::account, $testusers)
	      
