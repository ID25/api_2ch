# Api2ch

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'api_2ch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install api_2ch

## Usage
Create new Request
```ruby
request = Api2ch::Request.new
```
Then, get json with thread list.
```ruby
@threads = request.get_threads('pr')
```
For example, lets put in view name of threads
```slim
- @dvach["threads"].each do |thread|
  p= thread["subject"]
  small= "Views: #{thread['views']}"
  hr
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/api_2ch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## The MIT License (MIT)

Copyright (c) 2015 ID25

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
