class FrontEndHomePage
	
	# Again,only doing the elements I need for the challenge.
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.link(:text,/My Account/).exists? && @browser.link(:text,/My Account/).visible? }
		@myAccountLink = @browser.link(:text,/My Account/)
		@loginLink = @browser.link(:text,"Login")
	end
	
	def goto_login()
		@myAccountLink.click
		@loginLink.click
	end
	
end