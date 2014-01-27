require_relative '../../spec_helper'

describe Zauberflote::Person do
  describe 'attributes' do
    before do
      @person = Zauberflote::Person.new
      @person.name = "TestName"
    end
    it 'should receive the test name' do
      @person.name.must_equal "TestName"
    end
  end
  describe 'different instances' do
    before do
      @person1 = Zauberflote::Person.new
      @person1.name = "Test1"
      @person2 = Zauberflote::Person.new
      @person2.name = "Test2"
    end

    it 'should have different names' do
      @person2.name.wont_equal @person1.name
    end
  end

  describe 'save to highrise' do
    before do
      Zauberflote.configure('https://self1369.highrisehq.com/', '5bfa2ad349f174764a333b5eea8730cb')
      @person = Zauberflote::Person.new
      @person.name = "Last"
      @save1 = @person.highrise_save
      Zauberflote.configure('https://nathanthiesen.highrisehq.com/', '9f3e6a2786c7affce261b75c2f256463')
      @save2 = @person.highrise_save

    end
    it 'must return an id' do
      @save1.wont_be nil
    end
    it 'must save on different Highrise accounts' do
      @save1.wont_equal @save2
    end
  end

end