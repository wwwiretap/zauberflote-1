require_relative '../../spec_helper'

describe Zauberflote::Person do
  before(:each) {  @instance = Zauberflote::Instance.new("https://site.highrisehq.com", "my_api_token")  }
  
  describe "initialize" do
    before { @person = Zauberflote::Person.new(@instance) }
    
    it "must not instantiate without arguments" do
      expect( lambda { Zauberflote::Person.new }).to raise_error ArgumentError
    end
    
    it "must instantiate with at least an instance argument" do
      expect(@person).to be_a Zauberflote::Person
    end

    it "must not instantiate without an Zauberflote::Instance argument" do
      expect( lambda { Zauberflote::Person.new("foo") }).to raise_error ArgumentError
    end
  
  end
  describe "attributes" do
    
    before do 
      @info =  {
        name: "Nome",
        last_name: "Sobrenome",
        job_title: "Cargo",
        company: "Empresa",
        phone: "123456",
        email: "nome@empresa.com",
        website: "www.empresa.com"
      }
      @person = Zauberflote::Person.new(@instance, @info)
    end

    subject { @person }
    
    describe "attr_accessor" do
      it { should respond_to :name }
      it { should respond_to :last_name }
      it { should respond_to :job_title }
      it { should respond_to :company }
      it { should respond_to :phone }
      it { should respond_to :email }
      it { should respond_to :website }
      it { should_not respond_to :foo }
    end

    describe "attributes content" do
      specify { expect(@person.instance).to be_a Zauberflote::Instance }
      specify { expect(@person.name).to eq @info[:name]}
      specify { expect(@person.last_name).to eq @info[:last_name]}
      specify { expect(@person.job_title).to eq @info[:job_title]}
      specify { expect(@person.company).to eq @info[:company]}
      specify { expect(@person.phone).to eq @info[:phone]}
      specify { expect(@person.email).to eq @info[:email]}
      specify { expect(@person.website).to eq @info[:website]}
    end
  end
end