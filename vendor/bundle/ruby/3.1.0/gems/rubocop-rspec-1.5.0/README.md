# RuboCop RSpec

[![Gem Version](https://badge.fury.io/rb/rubocop-rspec.svg)](https://rubygems.org/gems/rubocop-rspec)
[![Dependency Status](https://gemnasium.com/nevir/rubocop-rspec.svg)](https://gemnasium.com/nevir/rubocop-rspec)
[![Build Status](https://secure.travis-ci.org/nevir/rubocop-rspec.svg?branch=master)](http://travis-ci.org/nevir/rubocop-rspec)
[![Coverage Status](https://codeclimate.com/github/nevir/rubocop-rspec/badges/coverage.svg)](https://codeclimate.com/github/nevir/rubocop-rspec/coverage)
[![Code Climate](https://codeclimate.com/github/nevir/rubocop-rspec.svg)](https://codeclimate.com/github/nevir/rubocop-rspec)

RSpec-specific analysis for your projects, as an extension to
[RuboCop](https://github.com/bbatsov/rubocop).


## Installation

Just install the `rubocop-rspec` gem

```bash
gem install rubocop-rspec
```

or if you use bundler put this in your `Gemfile`

```
gem 'rubocop-rspec'
```


## Usage

You need to tell RuboCop to load the RSpec extension. There are three
ways to do this:

### RuboCop configuration file

Put this into your `.rubocop.yml`.

```
require: rubocop-rspec
```

Now you can run `rubocop` and it will automatically load the RuboCop RSpec
cops together with the standard cops.

### Command line

```bash
rubocop --require rubocop-rspec
```

### Rake task

```ruby
RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rspec'
end
```


## The Cops

All cops are located under
[`lib/rubocop/cop/rspec`](lib/rubocop/cop/rspec), and contain
examples/documentation.

In your `.rubocop.yml`, you may treat the RSpec cops just like any other
cop. For example:

```yaml
RSpec/FilePath:
  Exclude:
    - spec/my_poorly_named_spec_file.rb
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

For running the spec files, this project depends on RuboCop's spec helpers.
This means that in order to run the specs locally, you need a (shallow) clone
of the RuboCop repository:

```bash
git submodule update --init vendor/rubocop
```

## License

`rubocop-rspec` is MIT licensed. [See the accompanying file](MIT-LICENSE.md) for
the full text.
