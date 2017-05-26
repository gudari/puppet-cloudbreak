class cloudbreak::install {

  class { '::docker':
    version      => $cloudbreak::docker_version,
    package_name => 'docker-engine',
  }

  file { $cloudbreak::download_dir:
    ensure => directory,
    owner  => $cloudbreack::cloudbreak_user,
    group  => $cloudbreack::cloudbreak_group,
  }

  file { $cloudbreak::extract_dir:
    ensure => directory,
    owner  => $cloudbreak::cloudbreak_user,
    group  => $cloudbreak::cloudbreak_group,
  }

  archive { "${cloudbreak::download_dir}/${cloudbreak::basefilename}":
    ensure          => present,
    extract         => true,
    extract_command => 'tar -xz %s',
    extract_path    => $cloudbreak::extract_dir,
    source          => $cloudbreak::package_url,
    creates         => "${cloudbreak::extract_dir}/cbd",
    require         => [
      File[$cloudbreak::extract_dir],
      File[$cloudbreak::download_dir],
    ],
  }

}
