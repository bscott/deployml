# DeploYML

* [deployml.rubyforge.org](http://deployml.rubyforge.org/)
* [github.com/postmodern/deployml](http://github.com/postmodern/deployml/)
* Postmodern (postmodern.mod3 at gmail.com)

## Description

DeploYML is a simple deployment solution that uses a single YAML file,
Git and SSH.

## Features

* Requires only **one YAML file** (`config/deploy.yml`) with a minimum of
  **two** things (`source` and `dest`).
* Supports multiple deployment environments (`config/deploy/staging.yml`).
* Supports [Git](http://www.git-scm.com/).
* Can deploy Ruby web applications or static sites.
* Supports common Web Servers:
  * [Apache](http://www.apache.org/)
  * [Mongrel](https://github.com/fauna/mongrel)
  * [Thin](http://code.macournoyer.com/thin/)
* Supports common Web Application frameworks:
  * [Rails](http://rubyonrails.org/):
    * [Bundler](http://gembundler.com/)
    * ActiveRecord
    * [DataMapper](http://datamapper.org/)
* **Does not** require anything else to be installed on the servers.
* **Does not** use `net-ssh`.
* Supports any Operating System that supports Ruby and SSH.
* Provides a simple command-line util using Thor.

## Examples

Specifying `source` and `dest` URIs as Strings:

    source: git@github.com:user/project.git
    dest: deploy@www.example.com/var/www/site

Specifying `dest` URI as a Hash:
      
    source: git@github.com:user/project.git
    dest:
      user: deploy
      host: www.example.com
      path: /var/www/site

Specifying a `server` option:

    source: git@github.com:user/project.git
    dest: deploy@www.example.com/var/www/site
    server: apache

Specifying a `server` with options:

    source: git@github.com:user/project.git
    dest: deploy@www.example.com/var/www/site
    server:
      name: thin
      options:
        servers: 4
	deamonize: true
	socket: /var/run/thin.sock
	rackup: true

## Synopsis

Cold-Deploy a new project:

    $ deployml deploy

Redeploy a project:

    $ deployml redeploy

Run a rake task on the deploy server:

    $ deployml rake 'db:automigrate'

Execute a command on the deploy server:

    $ deployml exec 'whoami'

SSH into the deploy server:

    $ deployml ssh

List available tasks:

    $ deployml help

## Requirements

* [addressable](http://addressable.rubyforge.org/) ~> 2.1.1
* [rprogram](http://github.com/postmodern/rprogram) ~> 0.1.8
* [thor](http://github.com/wycats/thor) ~> 0.14.3

## Install

    $ sudo gem install deployml

## Copyright

Copyright (c) 2010 Hal Brodigan

See {file:LICENSE.txt} for license information.

