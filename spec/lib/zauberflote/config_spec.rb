require_relative '../../spec_helper'

describe Zauberflote::Config do
	describe 'configure' do
		before do
			Zauberflote.configure('https://self1369.highrisehq.com/', '5bfa2ad349f174764a333b5eea8730cb')
		end
		it 'should return the config token' do
			Zauberflote.api_token.must_equal '5bfa2ad349f174764a333b5eea8730cb'
		end
		it 'should return the config url' do
			Zauberflote.url.must_equal 'https://self1369.highrisehq.com/'
		end

		describe 'configure_highrise' do
			it 'should return the same token of the Zauberflote instance' do
				Highrise::Base.user.must_equal Zauberflote.api_token
			end
			it 'should return the same url of the Zauberflote instance' do
				Highrise::Base.site.to_s.must_equal Zauberflote.url
			end
		end
	end

	


	
end