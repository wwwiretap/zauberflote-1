module Zauberflote
	class Person
		
		attr_accessor :name, :last_name, :job_title, :company, :phone, :email, :website
		
		def highrise_save
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
			begin
				@person.save
			rescue Exception => e
				puts person.errors
			end
			return @person.attributes['id']
		end
	end
end
