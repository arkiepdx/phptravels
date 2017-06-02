#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class AdminEditCustomerPage < AdminMenuStrip
	
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
	
	def get_country(country)
		@browser.label(:text,"Country").parent.spans[0].text		
	end
	
	def verify_customer(fname,lname,email,password,mobile,address1,country)
		assert(@firstName.value==fname, "First name #{@firstName.value} did not match expected #{fname}.")
		assert(@lastName.value==lname, "Last name #{@lastName.value} did not match expected #{lname}.")
		assert(@email.value==email, "Email #{@email.value} did not match expected #{email}.")
		assert(@mobile.value==mobile, "Mobile #{@mobile.value} did not match expected #{mobile}.")
		assert(@address1.value==address1, "Address1 #{@address1.value} did not match expected #{address1}.")
		assert(get_country(country)==country, "Country #{get_country(country)} did not match expected #{country}.")
	end
	
	private :get_country
end