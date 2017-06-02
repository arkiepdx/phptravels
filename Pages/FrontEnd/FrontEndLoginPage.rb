class FrontEndLoginPage
	
	# Not doing all the elements here just to save some time.
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.button(:type,"submit").exists? && @browser.button(:type,"submit").visible? }
		Watir::Wait.until { @browser.input(:name,"password").exists? && @browser.input(:name,"password").visible? }
		@usernameField = @browser.input(:name,"username")
		@passwordField = @browser.input(:name,"password")
		@loginButton = @browser.button(:type,"submit")
	end
			
	def login(username,password)
		@usernameField.send_keys username
		@passwordField.send_keys password
		@loginButton.click	
	end
		
	
end