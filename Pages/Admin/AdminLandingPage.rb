#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class AdminLandingPage < AdminMenuStrip
	
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.div(:text,"Revenue Chart").exists? && @browser.div(:text,"Revenue Chart").visible? }
		super(browser)
	end

end