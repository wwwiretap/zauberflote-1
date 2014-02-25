[![Code Climate](https://codeclimate.com/github/thiesen/zauberflote.png)](https://codeclimate.com/github/thiesen/zauberflote)
[![Build Status](https://travis-ci.org/thiesen/zauberflote.png?branch=master)](https://travis-ci.org/thiesen/zauberflote)
[![Coverage Status](https://coveralls.io/repos/thiesen/zauberflote/badge.png?branch=master)](https://coveralls.io/r/thiesen/zauberflote?branch=master)

# Zauberflote

This gem let your application save contacts in Highrise

## Installation

Add this line to your application's Gemfile:

    gem 'zauberflote', :git => 'git://github.com/thiesen/zauberflote.git'

And then execute:

    $ bundle

## Usage

Create an instance of Zauberflote
	
	zauberflote_instance = Zauberflote::Instance.new('https://mysite.highrisehq.com', 'My_API_TOKEN')

Create a Zauberflote::Person object
	
	@person = zauberflote_instance.create_person(params)

Save the object to your Highrise account

	@person.highrise_save

## Person Params

The Zauberflote::Person object support these parameters 
	
	params = { 
		:name => "Nathan",
		:last_name => "Thiesen",
		:company => "Nathan's Corp",
		:title => "CEO",
		:email => "nathan@nathanscorp.com",
		:website => "www.nathanscorp.com",
		:phone => '2233445566'
	} 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/thiesen/zauberflote/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

