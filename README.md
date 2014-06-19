# Devise::Stalkable

Stalkable is a gem that tracks logins of each user. Based on [devise-login_tracker](https://github.com/blueberryapps/devise-login_tracker)

## Installation

Add this line to your application's Gemfile (not on rubygems yet!):

    gem 'devise-stalkable', github: "unchris/stalkable"

And then execute:

    $ bundle install

## Usage

Run the generator with the model name (User in this example):

    $ rails g devise_stalkable User

Add `:stalkable` to `devise` in your model and association
to the login records. Example for User model:

```ruby
class User < ActiveRecord::Base
  devise :database_authenticatable, ..... , :stalkable

  has_many :logins, class_name: 'UserLogin'
end
```

## What is being tracked

For each login new record is created with following attributes:

* `ip_address` - IP address
* `user_agent` - User agent
* `signed_in_at` - Signed in at
* `last_seen_at` - Last seen at (on new requests)
* `signed_in_at` -  Signed out at (upon sign out)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright © 2014 Chris Cameron. See LICENSE for details.

