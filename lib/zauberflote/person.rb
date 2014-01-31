module Zauberflote
  class Person

    attr_accessor :name, :last_name, :job_title, :company, :phone, :email, :website, :instance

    def initialize(instance, params={})
        raise ArgumentError,"argument must be an instance of Zauberflote::Instance" unless instance.class == Zauberflote::Instance
        self.instance = instance
        params.each do |k,v| 
          if(self.respond_to? k)
            send("#{k}=",v)
          end 
        end
    end
    def highrise_save
      self.instance.configure_highrise
      @person = Highrise::Person.new(
            :first_name => self.name,
            :last_name => self.last_name,
            :title => self.job_title,
            :company_id => self.company,
            :contact_data => {
              :email_addresses => [
                :email_address => {
                    :address => self.email,
                    :location => 'Work'
                }
              ],
            :phone_numbers => [
              :phone_number => {
                :location => 'Work',
                :number => self.phone
              }
            ],
            :web_addresses => [
              :web_address => {
                :location => 'Work',
                :url => self.website
              }
            ]
          }
          )
        @person.save
      return @person.attributes['id']
    end
  end
end
