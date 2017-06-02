#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class AdminCustomersPage < AdminMenuStrip
	
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.button(:type,"submit").exists? && @browser.button(:type,"submit").visible? }
		super(browser)
		@addPerson = @browser.button(:type,"submit")
		
	end
	
	def add_customer()
		@addPerson.click	
	end
	
	def find_customer(lname)
		customerList = @browser.div(:class,"panel-body")
		foundIt=false
		link=nil
		customerList.tables.each do |p|
			if p.text.include?(lname)
				foundIt=true
				link=p.link(:title,"Edit")
				break
			end
		end
		
		if foundIt
			link.click
		else
			assert(1==2, "No such user with partial name #{lname} was found on the list -"+customerList.text)
		end
	end
end