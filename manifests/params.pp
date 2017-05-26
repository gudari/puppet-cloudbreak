class cloudbreak::params {

  $version          = '1.14.4'
  $docker_version   = '1.9.0'
  $download_dir     = '/var/tmp/cloudbreak'
  $mirror_url       = 'https://github.com/sequenceiq/cloudbreak-deployer/releases/download'

  $cloudbreak_group = 'cloudbreak'
  $cloudbreak_gid   = undef
  $cloudbreak_user  = 'cloudbreak'
  $cloudbreak_uid   = undef

}
