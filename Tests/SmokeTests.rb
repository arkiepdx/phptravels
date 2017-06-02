require 'test/unit'
require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'
require 'test/unit/assertions'
require 'watir-webdriver'
require 'json'
require 'rest-client'
require 'date'

include Test::Unit::Assertions

require '../Pages/Admin/AdminLoginPage.rb'
require '../Pages/FrontEnd/FrontEndHomePage.rb'
require '../Pages/FrontEnd/FrontEndMenuStrip.rb'
require '../Pages/FrontEnd/FrontEndLoginPage.rb'
require '../Pages/FrontEnd/FrontEndAccountPage.rb'
require '../Pages/FrontEnd/FrontEndToursPage.rb'
require '../Pages/FrontEnd/FrontEndTourDetailPage.rb'
require '../Pages/FrontEnd/FrontEndTourBookingPage.rb'
require '../Pages/FrontEnd/FrontEndInvoicePage.rb'
require '../Pages/Admin/AdminMenuStrip.rb'
require '../Pages/Admin/AdminLandingPage.rb'
require '../Pages/Admin/AdminAddTourPage.rb'
require '../Pages/Admin/AdminManageTourPage.rb'
require '../Pages/Admin/AdminToursPage.rb'
require '../Pages/Admin/AdminCustomersPage.rb'
require '../Pages/Admin/AdminAddCustomerPage.rb'
require '../Pages/Admin/AdminEditCustomerPage.rb'
require '../Pages/HomePage.rb'
require '../Api/User.rb'


class SmokeTests < Test::Unit::TestCase

	def setup
		$browser = Watir::Browser.start "http://phptravels.com/demo/", :chrome	
	end
	
	def teardown
		$browser.close
	end
	
	def test_create_a_new_user_as_an_admin
		myHomePage = HomePage.new($browser)
		myHomePage.goto_admin_site()
		$browser.driver.switch_to.window($browser.driver.window_handles[1])
		myLoginPage = AdminLoginPage.new($browser)
		myLoginPage.click_remember_me()
		myLoginPage.login("admin@phptravels.com","demoadmin")
		
		myAdminLandingPage = AdminLandingPage.new($browser)
		myAdminLandingPage.goto_customers()		
		myAdminCustomersPage = AdminCustomersPage.new($browser)
		myAdminCustomersPage.add_customer()	
		
		myAddCustomerPage = AdminAddCustomerPage.new($browser)
		rand = Random.rand(999999).to_s
		fname="myFName"+rand
		lname="myLName"+rand
		email="#{rand}@email.com"
		password="password1"
		mobile="1231231234"
		address1="12 Post main St"
		country="United States"		
		myAddCustomerPage.create_customer(fname,lname,email,password,mobile,address1,country)
		
		# Go verify that the user got created correctly
		myAdminCustomersPage.find_customer(fname)		
		myAdminEditCustomerPage = AdminEditCustomerPage.new($browser)
		myAdminEditCustomerPage.verify_customer(fname,lname,email,password,mobile,address1,country)
	end
	
	def test_create_a_tour_as_an_admin
		myHomePage = HomePage.new($browser)
		myHomePage.goto_admin_site()
		$browser.driver.switch_to.window($browser.driver.window_handles[1])
		myLoginPage = AdminLoginPage.new($browser)
		myLoginPage.click_remember_me()
		myLoginPage.login("admin@phptravels.com","demoadmin")
		
		myAdminLandingPage = AdminLandingPage.new($browser)
		myAdminLandingPage.add_tour()
		
		myAddTourPage = AdminAddTourPage.new($browser)		
		#I'd normally do something like this to generate new data
		#  But looks like there is a bug on the system that is only letting me create one tour?
		#name = "aaaaaaaaaaaaaaTour "+rand
		rand = Random.rand(9999999).to_s
		name = "786876"
		price="77"
		type="Educational"
		location="Port"
		myAddTourPage.create_tour(name,price,type,location)
		
		myToursPage = AdminToursPage.new($browser)
		myToursPage.view_tour(name)
		
		#validate that the tour got created correctly.
		myManageTourPage = AdminManageTourPage.new($browser)
		myManageTourPage.verify_tour(name,price,type,location,1)
		
		$browser.driver.switch_to.window($browser.driver.window_handles[0])		
		$browser.window(:url, /admin/ ).close
	end

	def test_login_into_admin_site_user_unknown
		myHomePage = HomePage.new($browser)
		myHomePage.goto_admin_site()
		$browser.driver.switch_to.window($browser.driver.window_handles[1])
		myLoginPage = AdminLoginPage.new($browser)
		myLoginPage.click_remember_me()
		myLoginPage.login("a@a.com","b")
		assert($browser.div(:class, /alert/).exists?, "We did not get the login failed message")
		$browser.driver.switch_to.window($browser.driver.window_handles[0])		
		$browser.window(:url, /admin/ ).close
	end
	
	def test_book_a_tour_as_a_client
		myHomePage = HomePage.new($browser)
		myHomePage.goto_client_site()
		$browser.driver.switch_to.window($browser.driver.window_handles[1])
		myHomePage = FrontEndHomePage.new($browser)
		myHomePage.goto_login()
		myLoginPage = FrontEndLoginPage.new($browser)
		myLoginPage.login("user@phptravels.com","demouser")
		
		myAccountPage = FrontEndAccountPage.new($browser)
		myAccountPage.goto_tours()
		
		myTour="thailand"
		myToursPage = FrontEndToursPage.new($browser)
		myToursPage.examine_tour(myTour)
		
		myTourDetailPage = FrontEndTourDetailPage.new($browser,myTour)
		myDate = "12/25/2017"
		myTourDetailPage.book_tour(myDate)
		
		myBooking = FrontEndTourBookingPage.new($browser,myTour,myDate)
		myBooking.confirm_booking()

		# I would have also verified the prices on the invoice, but I am unsure of the exact rules to follow.
		# Really follows the same validation steps I used to capture the data when creating the tour above.
		#     myManageTourPage.verify_tour(name,price,type,location,1)
		# Guess - capture the price from the tour details page, tax @ 5%, total = base+tax, deposit @ 10% of the total amt.
		myInvoice = FrontEndInvoicePage.new($browser,myTour,myDate)
		
		$browser.driver.switch_to.window($browser.driver.window_handles[0])		
		$browser.window(:url, /www.phptravels.net/ ).close
	end

end

Test::Unit::UI::Console::TestRunner.run(SmokeTests)

