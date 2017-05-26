class cloudbreak::install {

  class { '::docker':
    version        => $cloudbreak::docker_version,
  }

  file { $cloudbreak::extract_dir:
    ensure => directory,
  }

  archive { "${cloudbreak::download_dir}/${cloudbreak::basefilename}":
    ensure          => present,
    extract         => true,
    extract_command => 'tar -xz %s cbd',
    extract_path    => $cloudbreak::extract_dir,
    source          => $cloudbreak::package_url,
    creates         => "${cloudbreak::extract_dir}/cbd",
    require         => File[$cloudbreak::extract_dir],
  }

}
