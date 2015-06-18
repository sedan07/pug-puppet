class profile::base {
  # Create files/dirs from hash in hiera
  $files = hiera_hash('files', {})
  create_resources('file', $files)
}
