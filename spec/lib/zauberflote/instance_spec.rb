require_relative '../../spec_helper'

describe Zauberflote::Instance  do
  describe "initialize" do
    before do
      instance = Zauberflote::Instance.new("https://mysite.highrisehq.com", "my_api_token")
    end
    it 'should return the instance url' do
      instance.url.must_equal "https://mysite.highrisehq.com"
    end
    it 'should return the instance api token' do
      instance.api_token.must_equal "my_api_token"
    end
  end
  describe "configure_highrise" do
    before do
      @instance = Zauberflote::Instance.new("https://mysite.highrisehq.com", "my_api_token")
      @instance.configure_highrise
    end
    it 'should have the same url' do
      Highrise::Base.site.to_s.must_equal @instance.url
    end
    it 'should have the same api_token' do
      Highrise::Base.user.must_equal @instance.api_token
    end
    it 'should have the xml format' do
      Highrise::Base.format.to_s.must_equal "ActiveResource::Formats::XmlFormat"
    end
  end
  describe "create_person" do
    before do
      @instance = Zauberflote::Instance.new("https://mysite.highrisehq.com", "my_api_token")
      @person = @instance.create_person
    end
    it 'should be instance of Zauberflote::Person' do
      @person.must_be_instance_of Zauberflote::Person
    end
    it 'should have the instance as attribute' do
      @person.instance.must_equal @instance
    end
  end

  describe 'concurrent instances' do
    before do
      @instance_a = Zauberflote::Instance.new("https://instanceA.highrisehq.com", "tokenA")
      @instance_b = Zauberflote::Instance.new("https://instanceB.highrisehq.com", "tokenB")
    end

    it 'should have different url attribute values' do
      @instance_a.url.wont_equal @instance_b.url
    end
    it 'should have different api_token attributes' do
      @instance_a.api_token.wont_equal @instance_b.api_token.wont_equal
    end

  end

end