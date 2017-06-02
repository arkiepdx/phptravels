#require '../Pages/FrontEnd/FrontEndMenuStrip.rb'

#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class FrontEndAccountPage < FrontEndMenuStrip
		
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.image(:alt,"android").exists? }
		@usernameField = @browser.input(:name,"username")
		@passwordField = @browser.input(:name,"password")
		@loginButton = @browser.button(:type,"submit")
		super(browser)
	end
			
	def login(username,password)
		@usernameField.send_keys username
		@passwordField.send_keys password
		@loginButton.click	
	end
		
	
end