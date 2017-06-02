#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class AdminToursPage < AdminMenuStrip
	
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.button(:type,"submit").exists? && @browser.button(:type,"submit").visible? }
		super(browser)
		
	end
	
	def view_tour(name)
		assert(@browser.link(:text, name).exists?	, "No such tour with name #{name} exists")
		@browser.link(:text, name).click	
	end
	
end