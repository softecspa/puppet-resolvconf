# == class resolvconf
#
#  Manage resolv.conf files
#
# === Params
#
# [*add_localhost*]
#   I true 127.0.0.1 is added (mandatory)
#
# [*search*]
#   Search value (mandatory)
#
# [*nameserver1*]
#   Primary nameserver (mandatory)
#
# [*nameserver2*]
#   Secondary nameserver
#
# === Examples
#
class resolvconf (
  $add_localhost,
  $search,
  $nameserver1,
  $nameserver2 = '',
) {

  $resolvconf_path = $::lsbdistcodename? {
    'lucid'  => '/etc/resolv.conf',
    'wheezy' => '/etc/resolv.conf',
    default  => '/run/resolvconf/resolv.conf',
  }

  # notify{ "value of \$resolvconf_path is: ${resolvconf_path}": }

  file { $resolvconf_path:
    ensure  => present,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('resolvconf/resolv.conf.erb'),
  }

}
