# ItzLogger

ItzLogger is the N+1 log gem. Following the rule, that at least once in a life time every programmer has to write a log gem (or lib or app ...). 

This log gem supports multiple output channels:

1. log to the terminal (stdout only)
2. log to a file (not yet implemented)
3. log to a RabbitMQ service (not yet implemented)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itz_logger', '~> 0.2.6'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install itz_logger

## Usage

The usage is straight forward. Require the gem, create an object, configure it and write logs. 

### Log to the terminal (stdout)

First things first - install the gem. Take a look in the installation section.

A simple example:

```ruby
require 'itz_logger'

...

# you can choose the log_level from from
# - :info
# - :warn
# - :debug
# - :verbose
log_level = :info

# you can choose the target from
# - :log_terminal
log_target = :log_terminal

# create a logger
logger = ItzLogger::Logger.new(log_level, log_target)

# now go ahead
logger.info("foo")

logger.warn("bar")

logger.debug("baz")

logger.verbose("foo bar baz")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/schaary/itz_logger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ItzLogger project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/schaary/itz_logger/blob/master/CODE_OF_CONDUCT.md).
