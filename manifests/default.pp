# Checking if any trusted facts are defined in the cert, if not we disable this check for now
# to allow backwards compatibility
if !is_hash($trusted) {

  crit('Trsuted fact support MUST be turned on the server for any Puppet Catalogs to be served')

} else {
  unless count($trusted['extensions']) == 0 {
    if defined('$role') {
      fail('The servers role can NOT be overridden, it should always be defined by trusted facts')
    }
    if defined('$tier') {
      fail('The servers tier can NOT be overridden, it should always be defined by trusted facts')
    }

    $role = $trusted['extensions']['1.3.6.1.4.1.34380.1.1.100']
    $tier = $trusted['extensions']['1.3.6.1.4.1.34380.1.1.101']
  }

  # The $certname fact is self-reported by the node to we cannot trust it :-(
  # https://docs.puppetlabs.com/puppet/latest/reference/lang_facts_and_builtin_vars.html#puppet-agent-facts
  $trusted_certname = $trusted['certname']

  hiera_include('classes')
}

