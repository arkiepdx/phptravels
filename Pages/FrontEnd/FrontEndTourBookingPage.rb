#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class FrontEndTourBookingPage < FrontEndMenuStrip
		
	def initialize(browser,tourname,date)
		@browser=browser
		Watir::Wait.until { @browser.span(:text,"Booking Summary").exists? && @browser.span(:text,"Booking Summary").visible? }
		assert(@browser.url.downcase.include?(tourname.downcase), "Not on a page that contains #{tourname} - "+@browser.url)
		super(browser)
		@confirmBooking = @browser.button(:name, "logged")
		assert(@browser.text.include?(date), "Not on a page that contains our booking date #{date} - "+@browser.url)
	end
			
	def confirm_booking()
		@confirmBooking.click
	end
		
	
end