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

  $resolvconf_path= $::lsbdistcodename? {
    'precise' => '/run/resolvconf/resolv.conf',
    default   => '/etc/resolv.conf',
  }

  file {$resolvconf_path:
    ensure  => present,
    mode    => 644,
    owner   => root,
    group   => root,
    content => template("resolvconf/resolv.conf.erb"),
  }

}
