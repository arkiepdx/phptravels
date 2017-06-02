class AdminMenuStrip
	
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.span(:text,"Accounts").exists? && @browser.span(:text,"Accounts").visible? }
		@accountsSpan = @browser.span(:text,"Accounts")
		@toursSpan = @browser.span(:text,"Tours")
	end

	def goto_customers()
		@accountsSpan.click
		@browser.link(:text,"Customers").click
	end
	
	def add_tour()
		@toursSpan.click
		@browser.link(:text=>"Add New").click
	end
	
end