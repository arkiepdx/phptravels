# phptravels
To run the smoke tests:
cd into tests
run SmokeTests.rb from the command-line

I included a video of the tests running on my machine - Challenge.swf

As far as the API testing went - I did some investigation and put my notes into User.rb.
  I'm having trouble with getting the login call to return me the session/cookie info so that I could carry that forward.
  I was using Fiddler to peek the traffic, and Postman to try to create the calls before using RestClient

my machine:
ruby 2.2.6p396 (2016-11-15 revision 56800) [i386-mingw32]

*** LOCAL GEMS ***

archive-zip (0.7.0)
bigdecimal (1.2.6)
childprocess (0.7.0)
chromedriver-helper (1.1.0)
diff-lcs (1.3)
ffi (1.9.18 x86-mingw32)
io-console (0.4.3)
io-like (0.3.0)
json (1.8.1)
mini_portile2 (2.1.0)
minitest (5.4.3)
netrc (0.7.9)
nokogiri (1.7.2 x86-mingw32)
power_assert (0.2.2)
psych (2.0.8)
rake (10.4.2)
rdoc (4.2.0)
rest_client (1.8.3)
rspec (3.6.0)
rspec-core (3.6.0)
rspec-expectations (3.6.0)
rspec-mocks (3.6.0)
rspec-support (3.6.0)
rubyzip (1.2.1)
selenium-webdriver (3.4.0)
test-unit (3.0.8)
watir-webdriver (0.9.9)
websocket (1.2.4)
