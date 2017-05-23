class cloudbreak::params {

  $version          = '1.14.4'
  $docker_version   = '1.9.0'
  $extract_dir      = '/bin/'
  $download_dir     = '/var/tmp/cloudbreak'
  $mirror_url       = 's3.amazonaws.com/public-repo-1.hortonwork.com/HDP/cloudbreak'

  $cloudbreak_group = 'cloudbreak'
  $cloudbreak_gid   = undef
  $cloudbreak_user  = 'cloudbreak'
  $cloudbreak_uid   = undef


}
