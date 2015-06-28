# PUG Puppet

Simple puppet repo to demonstrate using Puppet Trusted Facts, best when used with the [pug-vagrant](https://github.com/sedan07/pug-vagrant) repo, as the puppet-master is already setup to work with this repo.

## Usage

You will need to install librarian-puppet if you don't already have it, then use it to install all the dependancies:

```
librarian-puppet install
```

^ this will pull all the 3rd party modules used into the `modules` dir.

## Structure

* `hiera` dir holds all the hiera yaml files
* `manifests` holds the entry point Puppet file, this is where Puppet first looks!
* `site` holds our own Role/Profile modules for tying it all together

## Branches

Check the git branches on Github:

* `master` (Trusted facts enabled and enforced)
* `migration` (allows nodes with no trusted data in their cert to still connect, but certs with trusted data must always use those facts)
* `not_trusted` (standard no-trusted-facts way of doing things)
 
## hiera config used

You won't need this if you use the `pug-vagrant` repo mentioned above but if you don't:

```
---
:backends:
  - yaml
:yaml:
  :datadir: /etc/puppet/environments
:hierarchy:
  - "%{::environment}/hiera/role_%{::role}/tier_%{::tier}"
  - "%{::environment}/hiera/role_%{::role}"
  - "%{::environment}/hiera/osfamily/%{::os_family}"
  - "%{::environment}/hiera/virtual/%{::virtual}"
  - "%{::environment}/hiera/common"
```
