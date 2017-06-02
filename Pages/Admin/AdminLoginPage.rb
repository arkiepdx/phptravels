class AdminLoginPage
	
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.button(:type,"submit").exists? && @browser.button(:type,"submit").exists?  }
		Watir::Wait.until { @browser.label(:text,"Remember me").exists? && @browser.label(:text,"Remember me").visible? }
		Watir::Wait.until { @browser.input(:name,"password").exists? && @browser.input(:name,"password").visible? }
		@usernameField = @browser.input(:name,"email")
		@passwordField = @browser.input(:name,"password")
		@loginButton = @browser.button(:type,"submit")
		@rememberMe = @browser.label(:text,"Remember me")
		@forgotPassword = @browser.link(:text,"Click Here")
	end
			
	def login(username,password)
		@usernameField.send_keys username
		@passwordField.send_keys password
		@loginButton.click	
	end
	
	def click_remember_me()
		@rememberMe.click	
	end
	
	def forgot_password()
		@forgotPassword.click
	end
	
end