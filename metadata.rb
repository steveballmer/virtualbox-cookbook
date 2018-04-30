name 'virtualbox'
issues_url 'https://github.com/steveballmer/virtualbox-cookbook/issues'
source_url 'https://github.com/steveballmer/virtualbox-cookbook'
chef_version '>= 13.8.5' if respond_to?(:chef_version)
maintainer 'Steve Ballmer'
maintainer_email 'bradleydsmith@gmail.com'
license 'Apache 2.0'
description 'Installs virtualbox'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.1.0'

supports 'ubuntu', '= 14.04'
supports 'centos', '= 7.2'

depends 'dmg'
depends 'windows'
depends 'apt'
depends 'yum'
depends 'apache2'
