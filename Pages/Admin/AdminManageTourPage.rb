#  The basic idea is that I am creating a MenuStrip that is reusable, and can be called directly from any page that inherits it.
#  Not your classic "IS-A" relationship, but it does encourage re-use of code.
class AdminManageTourPage < AdminMenuStrip
	
	def initialize(browser)
		@browser=browser
		Watir::Wait.until { @browser.button(:id,"update").exists? && @browser.button(:id,"update").visible? }
		super(browser)
		
		@tourName = @browser.input(:name, "tourname")
		@tourAdultPrice = @browser.input(:name, "adultprice")
		@submit = @browser.button(:id,"add")
	end
	
	def get_tour_type(type)
		@browser.label(:text,"Tour Type").parent.spans[0].text	
	end
	
	def get_tour_location(index,location)
		@browser.label(:text,"Location #{index}").parent.spans[0].text		
	end

	
	def verify_tour(name,price,type,location,loc_index)
		assert(@tourName.value==name, "Tour name #{@tourName.value} did not match expected #{name}.")
		assert(@tourAdultPrice.value==price, "Tour price #{@tourAdultPrice.value} did not match expected #{price}.")
		assert(get_tour_type(type)==type, "Tour type #{get_tour_type(type)} did not match expected #{type}.")
		assert(get_tour_location(loc_index,location).include?(location), "Tour location #{get_tour_location(loc_index,location)} did not match expected #{location}.")
	end

	private :get_tour_type, :get_tour_location
end