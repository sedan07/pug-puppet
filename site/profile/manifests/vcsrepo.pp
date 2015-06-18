class profile::vcsrepo {

  include ::git

  Vcsrepo {
    provider => 'git',
    require  => Package['git'],
  }

  # Create any vcs repo's we need
  $repos = hiera_hash('vcsrepos', {})
  create_resources('vcsrepo', $repos)
}
