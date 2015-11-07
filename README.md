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
request = Api2ch::Request.new(board: 'b') # default board for requests
```
Then, get json with thread list.
```ruby
@threads = request.call_threads(board: 'pr')
```
For example, lets put in view name of threads
```slim
- @threads["threads"].each do |thread|
  p= thread["subject"]
  small= "Views: #{thread['views']}"
  hr
```

## Api

#### Get threads json.
```ruby
@threads = request.call_threads(board: 'pr')
```

#### Get threads json with full info.
```ruby
@threads = request.call_full_threads(board: 'pr', page: page) # default: 'index'
```

#### Get most viewed threads.
```ruby
@threads = request.call_most_viewed_threads(board: 'fg')
```

#### Get posts from thread.
```ruby
@threads = request.call_thread_posts(board: 'rf', thread: 543235)
```

#### Get latest bumped threads.
```ruby
@threads = request.call_latest_bump_threads(board: 'ga')
```

#### Get recent created threads.
```ruby
@threads = request.call_new_threads(board: 'sci')
```

```json
["timestamp"] = The creation of the thread
["threads"]   = Array of threads
["subject"]   = Thread name
["views"]     = Thread views
["board"]     = Board name
["score"]     = Popularity thread
["num"]       = Thread number
```

## Contributing

1. Fork it ( https://github.com/ID25/api_2ch/fork )
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
