# Puppet SSH Config Module

```ruby
mod "puppetlabs/stdlib", "4.5.1"

# dep: puppetlabs/stdlib
mod "puppetlabs/concat", "1.2.0"

# dep: puppetlabs/stdlib
# dep: puppetlabs/concat
mod "saz/ssh", "2.5.0"

# dep: puppetlabs/stdlib
# dep: saz/ssh
mod "weyforth/ssh_config",
	git: "https://github.com/weyforth/puppet-ssh_config.git",
	ref: "master"
```
