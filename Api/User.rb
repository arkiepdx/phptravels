
class User 

	@weatherEndPoint = 'http://api.wunderground.com/api/6bbda1bd6ef36853/conditions/q/CA/San_Francisco.json'
	@postEndPoint = 'https://jsonplaceholder.typicode.com/posts'
	@number = DateTime.parse(Time.now.to_s).strftime("%s")
	@username = "user#{@number}}"
	@email = "email#{@number}}@tester.com"

	
	def createUser
	
		RestClient.post postEndPoint, {userId: 10, id: 64, title: "bbbasasar", body: "nnhuiue"}
		parsed = JSON.parse(response)
		puts parsed["id"]
		puts parsed["title"]
		pop = gets
	end

	def deleteUser
		myLoginPage = LoginPage.new($browser)
		searchString="ruby"
		myLoginPage.search(searchString)
		#assert_no_match(/something on the next page/, $browser.html, message="Did get to the login page when not expected - #{searchString}")
		pop = gets
	end
	
	def weather
		response = RestClient.get @weatherEndPoint
		parsed = JSON.parse(response)
		puts parsed["current_observation"]["display_location"]["city"]
		puts parsed["current_observation"]["temperature_string"]
	end

end