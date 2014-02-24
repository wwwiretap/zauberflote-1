require_relative '../../spec_helper'

describe Zauberflote::Instance  do
  let(:site) { "https://www.mysite.highrisehq.com" }
  let(:api_token) { "my_api_token" }

  before { @instance = Zauberflote::Instance.new(site, api_token) }
  describe "attributes" do
    it "must have the url attribute" do
      expect(@instance).to respond_to :url
    end

    it "must have the api_token attribute" do
      expect(@instance).to respond_to :api_token
    end
  end
  describe "#initialize" do
    
    it "must raise exception without arguments" do
      expect(lambda { instance = Zauberflote::Instance.new }).to raise_error ArgumentError
    end
    it "must raise exception with only one argument" do
      expect(lambda { instance = Zauberflote::Instance.new(site) }).to raise_error ArgumentError
    end
    it "must instantiate with two arguments" do
      expect(@instance).to be_a Zauberflote::Instance
    end
  end 
  describe "#configure_highrise" do
    before { @instance.configure_highrise }
    it "must have the same url than highrise" do
      expect(Highrise::Base.site.to_s).to eq @instance.url
    end
    it "must have the same api token than highrise" do
      expect(Highrise::Base.user).to eq @instance.api_token
    end
    it "must set the highrise format to xml" do
      expect(Highrise::Base.format).to be_a ActiveResource::Formats::XmlFormat
    end
  end

  describe "#create_person" do
    before { @person = @instance.create_person({}) }
    it "must create a Zauberflote::Person object" do
      expect(@person).to be_a Zauberflote::Person
    end
    it "must have the instance as attribute" do
      expect(@person.instance).to eq @instance
    end
    describe "multiple instances" do
      before do
        @instance_a = Zauberflote::Instance.new(site, api_token)
        @instance_b = Zauberflote::Instance.new("http://site2.highrisehq.com", "another_api_token")
        @person_a = @instance_a.create_person({})
        @person_b = @instance_b.create_person({})
      end
      it "must have different instance attributes" do
        expect(@person_a.instance).to_not eq @person_b.instance
      end 
    end
  end

end
