module Zauberflote
  class Person

    attr_accessor :name, :last_name, :job_title, :company, :phone, :email, :website, :instance

    def initialize(instance, params=nil)
        raise ArgumentError,"argument must be an instance of Zauberflote::Instance" unless instance.class == Zauberflote::Instance
        self.instance = instance
    end

    def highrise_save
      self.instance.configure_highrise
      @person = Highrise::Person.new(
            :first_name => self.name,
            :last_name => self.last_name,
            :title => self.job_title,
            #:website => self.website,
            #:phone => self.phone,
            :company_id => self.company,
            :contact_data => {
              :email_addresses => [
                :email_address => {
                    :address => self.email,
                }
              ],
              :phone_numbers => [
              	:phone_number => {
              		:number => self.phone
              	}
              ]
          }
          )
        @person.save
      return @person.attributes['id']
    end
  end
end
