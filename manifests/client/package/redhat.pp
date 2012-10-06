# Class: ldap::client::package::redhat
#
# This module manages LDAP client package installation on RHEL based systems
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class ldap::client::package::redhat(
  $ensure
) {
  $redhat_packages = ['openldap', 'openldap-clients', 'nss_ldap']
  
  if $ensure == 'present' {
    realize Package[$ldap::params::openldap_packages]
  } else {
    package { $ldap::params::openldap_packages :
      ensure => $ensure,
    }
  }
  
  package {'nss_ldap':
    ensure => $ensure,
  }
}
