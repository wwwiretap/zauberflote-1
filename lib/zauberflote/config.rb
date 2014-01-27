module Zauberflote
  module Config

    attr_accessor :api_token, :url
    def configure(url, api_token)
      self.url = url
      self.api_token = api_token
      configure_highrise
    end

    def configure_highrise
      Highrise::Base.format = :xml
      Highrise::Base.site = self.url
      Highrise::Base.user = self.api_token

    end
  end
end
