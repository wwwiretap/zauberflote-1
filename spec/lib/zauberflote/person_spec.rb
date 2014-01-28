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
      @instance = Zauberflote::Instance.new('https://nathanthiesen.highrisehq.com/', '9f3e6a2786c7affce261b75c2f256463')
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
     @instance = Zauberflote::Instance.new('https://nathanthiesen.highrisehq.com/', '9f3e6a2786c7affce261b75c2f256463')
     @person = @instance.create_person({:name => "foo"})
     @person_nil = @instance.create_person
     @save = @person.highrise_save
     @save_nil = @person_nil.highrise_save
    end
  end

  describe 'saving people in concurrent instances' do
    before do
      @instance_a = Zauberflote::Instance.new('https://self1369.highrisehq.com/', '5bfa2ad349f174764a333b5eea8730cb')
      @instance_b = Zauberflote::Instance.new('https://nathanthiesen.highrisehq.com/', '9f3e6a2786c7affce261b75c2f256463')
      @person_a = @instance_a.create_person({:name => "InstanceA"})
      @person_b = @instance_b.create_person({:name => "InstanceB"})
    end


  end

end