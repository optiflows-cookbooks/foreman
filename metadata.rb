name 'foreman'
maintainer 'Guilhem Lettron'
maintainer_email 'guilhem.lettron@optiflows.com'
license 'Apache-2.0'
description 'Installs/Configures foreman'
source_url 'https://github.com/redguide/foreman'
issues_url 'https://github.com/redguide/foreman/issues'
version '0.0.1'

depends 'apt'
depends 'apache2'
depends 'bind'
depends 'database'
depends 'dhcp'
depends 'git'
depends 'hostname'
depends 'hostsfile'
depends 'mysql'
depends 'mysql2_chef_gem'
depends 'postgresql'
depends 'tftp'

chef_version '>= 12.1'

supports 'ubuntu'
