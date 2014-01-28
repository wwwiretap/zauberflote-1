require_relative '../../spec_helper'

describe Zauberflote::Person do 
  describe "initialize(instance)" do 
    it 'should not instantiate without the instance argument' do
      lambda { Zauberflote::Person.new }.must_raise ArgumentError
    end
    it 'should not instantiate if the argument isn\'t an instance of Zauberflote::Instance' do
      lambda{ Zauberflote::Person.new("foo") }.must_raise ArgumentError
    end
  end
  describe "initialize(instance, params)" do
    before do
      @instance = Zauberflote::Instance.new("https://mysite.highrisehq.com", "my_api_token")
      @person = @instance.create_person({:name => "foo", :unknown => "bar"})
    end
    it 'must receive the params argument' do
      @person.name.must_equal "foo"
    end
    it 'must ignore the unknown key' do
      lambda {@person.unknown}.must_raise NoMethodError
    end
  end
  describe 'highrise_save' do
    before do
     @instance = Zauberflote::Instance.new("https://mysite.highrisehq.com", "my_api_token")
     @person = @instance.create_person({:name => "foo"})
     @person_nil = @instance.create_person
     @save = @person.highrise_save
     @save_nil = @person_nil.highrise_save
    end
    it 'must configure highrise' do
      Highrise::Base.site.to_s.must_equal @instance.url
    end

  end
end