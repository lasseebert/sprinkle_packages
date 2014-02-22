# Sprinkle packages

A bunch of Sprinkle packages I use

## Installation

Add this line to your application's Gemfile:

    gem 'sprinkle_packages', github: 'lasseebert/sprinkle_packages', require: false

And then execute:

    $ bundle

## Usage

In your sprinkle file:

    require 'sprinkle_packages'

And then use the packages as any other Sprinkle package

    policy :some_policy, :roles => :some_role do
      requires :ruby, ruby_version: File.read('.ruby-version').strip
      ...
    end

## Contributing

1. Fork it ( http://github.com/<my-github-username>/sprinkle_packages/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
