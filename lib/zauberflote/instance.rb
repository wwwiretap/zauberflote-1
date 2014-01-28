module Zauberflote
  
  class Instance
    require 'zauberflote/person'
    
    attr_accessor :api_token, :url

    def initialize(url, api_token)
      self.url = url
      self.api_token = api_token
    end

    def create_person(params=nil)
      Person.new(self, params)
    end

    def configure_highrise
      Highrise::Base.format = :xml
      Highrise::Base.site = self.url
      Highrise::Base.user = self.api_token

    end

	end
end