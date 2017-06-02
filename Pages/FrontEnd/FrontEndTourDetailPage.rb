#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class FrontEndTourDetailPage < FrontEndMenuStrip
		
	def initialize(browser,tourname)
		@browser=browser
		Watir::Wait.until { @browser.link(:href,/#collapseMap/).exists? && @browser.link(:href,/#collapseMap/).visible? }
		assert(@browser.url.downcase.include?(tourname.downcase), "Not on a page that contains #{tourname} - "+@browser.url)
		super(browser)
		@bookIt = @browser.button(:text, "Book Now")
		@date = @browser.input(:name, "date")

	end
			
	def book_tour(date)
		@date.to_subtype.clear
		@date.send_keys date
		@date.send_keys :enter
		@bookIt.click
	end
		
	
end