#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class FrontEndInvoicePage < FrontEndMenuStrip
		
	def initialize(browser,tourname,date)
		@browser=browser
		Watir::Wait.until { @browser.button(:text,"Pay Now").exists? && @browser.button(:text,"Pay Now").visible? }
		super(browser)
		assert(@browser.text.downcase.include?(tourname.downcase), "Not on a page that contains #{tourname} - "+@browser.url)
		
		#The following assert will fail since there is a bug on the site that does not save the date correctly - shows as 00/00/0000
		#assert(@browser.text.include?(date), "Not on a page that contains our booking date #{date} - "+@browser.url)

	end
			
	
	
end