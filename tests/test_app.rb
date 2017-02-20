require 'minitest/autorun'
require 'rack/test'
require_relative '../app.rb'

class TestApp < Minitest::Test 
	include Rack::Test::Methods

	def app
		PersonalDetailsApp
	end

	def test_ask_name_on_etry_page
		get '/'
		assert(last_response.ok?)
		assert(last_response.body.include?('Hello, what is your name?'))
		assert(last_response.body.include?('<input type="text" name="name_input">'))
	end
end
