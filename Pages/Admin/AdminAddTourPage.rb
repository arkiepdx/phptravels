#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class AdminAddTourPage < AdminMenuStrip
	
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.button(:id,"add").exists? && @browser.button(:id,"add").visible? }
		super(browser)
		refresh_refs()
	end
		
	def refresh_refs()
		@tourName = @browser.input(:name, "tourname")
		@tourAdultPrice = @browser.input(:name, "adultprice")
		@tourType = @browser.span(:text, "Select")
		@location = @browser.span(:text, "Enter Location")
		@submit = @browser.button(:id,"add")
	end
	
	def choose_tour_type(type)
		@tourType.click
		assert(@browser.div(:text, /#{type}/).exists?	, "No such tour type #{type} exists")
		@browser.div(:text, type).click	
	end
	
	def choose_tour_location(location)
		@location.click
		@browser.send_keys location
		@browser.send_keys :enter		
	end

	def create_tour(name,price,type,location)
		@tourName.send_keys name
		@tourAdultPrice.send_keys price
		choose_tour_type(type)
		choose_tour_location(location)
		refresh_refs
		@submit.wd.location_once_scrolled_into_view
		@submit.click
	end
	
	private :choose_tour_location, :choose_tour_type, :refresh_refs
end