class HomePage
	
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.link(:class,"login").visible? }
	end
	
	def goto_login()
		@browser.link(:class,"login").click
	end
	
	def goto_admin_site()
		@browser.link(:href,"//www.phptravels.net/admin").click
	end
	
	def goto_client_site()
		@browser.link(:href,"//www.phptravels.net").click
	end
	
end