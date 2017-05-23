# Class: cloudbreak
# ===========================
#
# Full description of class cloudbreak here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'cloudbreak':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class cloudbreak (

  $version          = $cloudbreak::params::version,
  $docker_version   = $cloudbreak::params::docker_version,

  $base_url         = $cloudbreak::params::base_url,
  $extract_dir      = $cloudbreak::params::extract_dir,
  $download_dir     = $cloudbreak::params::download_dir,
  $mirror_url       = $cloudbreak::params::mirror_url,
  $basefilename     = "cloudbreak-deployer_${version}_${::kernel}_${::processors['isa']}.tgz",
  $package_url      = "${mirror_url}/v${version}/${basefilename}",

  $cloudbreak_group = $cloudbreak::params::cloudbreak_group,
  $cloudbreak_gid   = $cloudbreak::params::cloudbreak_gid,
  $cloudbreak_user  = $cloudbreak::params::cloudbreak_user,
  $cloudbreak_uid   = $cloudbreak::params::cloudbreak_uid,
  
) inherits cloudbreak::params {

  group { $cloudbreak_group:
    ensure => present,
    gid    => $cloudbreak_gid,
  }

  user { $cloudbreak_user:
    ensure  => present,
    uid     => $cloudbreak_uid,
    groups  => $nifi_group,
    require => Group[ $cloudbreak_group ],
  }

  anchor { 'cloudbreak::start': } ->
  class { 'cloudbreak::install': } ->
  anchor { 'cloudbreak::end': }

}
