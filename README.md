# MAYaml for Mutt

[![Gem Version](https://badge.fury.io/rb/mayaml-mutt.svg)](http://badge.fury.io/rb/mayaml-mutt)
[![Code Climate](https://codeclimate.com/github/skopciewski/mayaml-mutt/badges/gpa.svg)](https://codeclimate.com/github/skopciewski/mayaml-mutt)
[![Dependency Status](https://gemnasium.com/badges/github.com/skopciewski/mayaml-mutt.svg)](https://gemnasium.com/github.com/skopciewski/mayaml-mutt)

This is the mutt configs generator which gets the accounts settigns from yaml file. See [Mayaml][mayaml_url]
The mutt configuration is designed to handle many accounts and one inbox. (example implementation: [DockerMutt][docker_mutt_url])

## Installation

Add this line to your application's Gemfile:

    gem 'mayaml-mutt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mayaml-mutt

## Usage

If ruby bin dir is in your PATH, just call `mayaml-mutt-init <path_to_the_yaml_file> [<destination_config_file>]` 
to list generated configs or store them in `destination_config_file`.
Or `mayaml-mutt-creds <path_to_the_yaml_file> [<dir_for_storing_configs>]` 
to list generated configs or store them in `dir_for_storing_configs`.

## Versioning

See [semver.org][semver]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[semver]: http://semver.org/
[mayaml_url]: https://github.com/skopciewski/mayaml
[docker_mutt_url]: https://github.com/skopciewski/docker-mutt
