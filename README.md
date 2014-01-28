# Zauberflote

This gem enable your application to save contacts in Highrise

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
	{
	:name => "Nathan",
	:last_name => "Thiesen",
	:company => "Nathan's Corp",
	:title => "CEO",
	:email => "nathan@nathanscorp.com",

} 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
