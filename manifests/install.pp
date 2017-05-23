class cloudbreak::install {

  class { 'docker':
    version        => $cloudbreak::docker_version,
    manage_package => true,
  }

  archive { "${cloudbreak::download_dor}/${cloudbreak::basefilename}":
    ensure          => present,
    extract         => true,
    extract_command => 'tar xz %s cbd',
    extract_path    => $cloudbreak::extractdir,
    source          => $cloudbreak::package_url,
    creates         => "${cloudbreak::extractdir}/cbd",
  }

}
