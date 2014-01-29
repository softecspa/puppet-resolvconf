# == define resolvconf::set
#
# Wrapper around class resolvconf
# Tricky way to override class parameters
#
# === Params
#
# [*add_localhost*]
#   I true 127.0.0.1 is added (default: false)
#
# [*search*]
#   Search value (default: softecspa.it)
#
# [*nameserver1*]
#   Primary nameserver (default: 8.8.8.8)
#
# [*nameserver2*]
#   Secondary nameserver (default: 8.8.4.4)
#
define resolvconf::set (
  $add_localhost  = false,
  $search         = 'softecspa.it',
  $nameserver1    = '8.8.8.8',
  $nameserver2    = '8.8.4.4',
) {

  class {'resolvconf':
    add_localhost => $add_localhost,
    search        => $search,
    nameserver1   => $nameserver1,
    nameserver2   => $nameserver2,
  }
}
