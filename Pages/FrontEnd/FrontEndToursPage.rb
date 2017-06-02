#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class FrontEndToursPage < FrontEndMenuStrip
		
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.button(:type, "submit").exists? && @browser.button(:type, "submit").visible? }
		super(browser)

	end
			
	def examine_tour(tourname)
		assert(@browser.link(:href, /#{tourname}/).exists?	, "No such tour #{tourname} exists")
		@browser.link(:href, /#{tourname}/).images[0].click
	end
		
	
end