knife-freezer
=============

Knife plugin to store and retrieve node attributes via a databag

# Installation #

This plugin is distributed as a Ruby Gem. To install it, run:

    $ gem install knife-freezer

Depending on your system's configuration, you may need to run this command with root privileges.

# Configuration #

The following options may be set in your `knife.rb`:

* environment

# Subcommands #

This plugin provides the following Knife subcommands. Specific command options can be found by invoking the subcommand with a `--help` flag

knife freezer show
-----------------------------

Show the value of the given attribute for the given role.

knife freezer store
-----------------------------

Add the given attribute to the freezer databag based on the first existing node found with the given role.

knife freezer remove
---------------------------

Remove the given attribute of the given role from the freezer databag.

# License #

Author:: David Ackerman (<david.ackerman@cybera.ca>)

License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.