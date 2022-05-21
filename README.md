# BenchMarkMethods

Measure and benchmark execution time of your ruby methods. Forget about `Time.now - t` solution. Use `benchmark` to see how much time it takes to execute your method.

[![Build Status](https://travis-ci.org/igorkasyanchuk/benchmark_methods.svg?branch=master)](https://travis-ci.org/igorkasyanchuk/benchmark_methods)
[![Gem Version](https://badge.fury.io/rb/benchmark_methods.svg)](https://badge.fury.io/rb/benchmark_methods)
[![RailsJazz](https://github.com/igorkasyanchuk/rails_time_travel/blob/main/docs/my_other.svg?raw=true)](https://www.railsjazz.com)
[![https://www.patreon.com/igorkasyanchuk](https://github.com/igorkasyanchuk/rails_time_travel/blob/main/docs/patron.svg?raw=true)](https://www.patreon.com/igorkasyanchuk)

Sample or usage:

[![Sample](https://raw.githubusercontent.com/igorkasyanchuk/benchmark_methods/master/benchmark_methods.png)](https://raw.githubusercontent.com/igorkasyanchuk/benchmark_methods/master/benchmark_methods.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'benchmark_methods'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install benchmark_methods


**Note: works only for Ruby 2+**

## Usage

Let's say you have sample model `User` with two methods:


```ruby
class User < ActiveRecord::Base
  include BenchmarkMethods

  benchmark :generate_report
  cbenchmark :import_users

  def generate_report
    report = reports.create(name: 'My Report')
    report.add_db_data
    report.generate
    report
  end

  def self.import_users(csv)
    CSV.parse(csv) do |row|
      process_import_user(row)
    end
  end
end
```

**Sample Output:**

```
  --> User.create_user_and_comments
      user     system      total        real
  0.010000   0.000000   0.010000 (  0.006721)
  --> User create_test_friend
      user     system      total        real
  0.000000   0.000000   0.000000 (  0.000681)
```

Gem allows to **benchmark ruby methods** (instance and class methods).

### Functionality

`include BenchmarkMethods` - put in your classes, models to add support for benchmarks

`benchmark :method_name` - benchmark your instance method.

`cbenchmark :method_name` - benchmark your class method.

## Plans

* Add more Specs

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/benchmark_methods/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[<img src="https://github.com/igorkasyanchuk/rails_time_travel/blob/main/docs/more_gems.png?raw=true"
/>](https://www.railsjazz.com/?utm_source=github&utm_medium=bottom&utm_campaign=benchmark_methods)
