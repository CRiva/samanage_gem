[![Build Status](https://travis-ci.org/CRiva/samanage_gem.svg?branch=master)](https://travis-ci.org/CRiva/samanage_gem)

Development for this gem has stopped due to [another](https://github.com/cw2908/samanage-ruby) Samanage Gem already out. Use the linked gem instead. 


# Samanage

This gem is a simple interface to the [Samanage](https://www.samanage.com/api/) api to create an Incident within your samanage environment.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'samanage'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install samanage

## Usage

Anywhere in your code, you need to configure the Samanage gem with the correct uri and Samanage token.

If you are using this within a Rails application, it could be configured within `config/initializers/samanage.rb` 

Configuration is easy:
```ruby
Samanage.configure do |conf|
	conf.uri = "https://api.samanage.com/incidents.json"
	conf.jwt = "Bearer <Samanage token>"
end
```

Then to create the incident, call the `createIncident` method:

```ruby
Samanage.createIncident(@ticket)
```

The ticket is a hash that follows Samanage's [api standards](https://www.samanage.com/api/incidents/):
```ruby
{“incident”: {
   “name”:”Incident_Title”,
   “priority”:”PRIORITY”,
   “category”:{“name”:”Incident category”},
   “subcategory”:{“name”:”Incident subcategory”},
   “requester”:{“email”:”demo@samanage.com”},
   “description”:”Incident description”,
   “due_at”:”Dec 11,2022″,
   “assignee”:{“email”:”demo@samanage.com”},
   “incidents”:{“incident”:[{“number”:”12345″},{“number”:”12345″}]},
   “Problem”:[{“number”:”123″}],
   “changes”:[{“number”:”123″}],  
   “Solutions”:{“solution”:[{“number”:”123″}]},
   “assets”:[{“id”:”123″}],
   “mobiles”:[{“id”:”123″}],
   “configuration_items”:[{“id”:”123″}],
   “custom_fields_values”:{
     “custom_fields_value”:[
       {“name”:”field_name”,”value”:”content”},
       {“name”:”field_name”,”value”:”content”}]
   }
 }
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on Bitbucket at https://bitbucket.org/westmont/samanage_gem/src.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
