class FrontEndMenuStrip

	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.link(:text,"Blog").exists? && @browser.link(:text,"Blog").visible? }
		@toursLink = @browser.link(:text,"Tours")
	end

	def goto_tours()
		@toursLink.click
	end
	
end