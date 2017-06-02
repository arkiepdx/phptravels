#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class AdminAddCustomerPage < AdminMenuStrip
	
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.button(:text,"Submit").exists? && @browser.button(:text,"Submit").visible? }
		super(browser)
		
		@firstName = @browser.input(:name, "fname")
		@lastName = @browser.input(:name, "lname")
		@email = @browser.input(:name, "email")
		@password = @browser.input(:name, "password")
		@mobile = @browser.input(:name, "mobile")
		@address1 = @browser.input(:name, "address1")
		@address2 = @browser.input(:name, "address2")
		@country = @browser.span(:text, "Please Select")
		@submit = @browser.button(:text,"Submit")
	end
	
	def choose_country(country)
		@country.click
		@browser.send_keys country
		@browser.send_keys :enter		
	end
	
	def create_customer(fname,lname,email,password,mobile,address1,country)
		@firstName.send_keys fname
		@lastName.send_keys lname
		@email.send_keys email
		@password.send_keys password
		@mobile.send_keys mobile
		@address1.send_keys address1
		choose_country(country)
		@submit.click
	end
	
	private :choose_country
end