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
		assert(last_response.body.include?('<form method="post" action="/name">'))
		assert(last_response.body.include?('<input type="submit" value="submit">'))
	end

	def test_post_to_name
		post '/name', name_input: 'Chloe'
		follow_redirect!
		assert(last_response.body.include?('Chloe'))
		assert(last_response.ok?)
	end

	def test_get_age
		get '/age?name=Chloe'
		assert(last_response.body.include?('Hello Chloe! How old are you?'))
		assert(last_response.ok?)
	end

	def test_post_to_age
		post '/age', age_input: '16', name_input: 'Chloe'
		follow_redirect!
		assert(last_response.body.include?('16'))
		assert(last_response.ok?)
	end

	def test_get_fav_nums
		get '/fav_nums?age=16&name=Chloe'
		assert(last_response.ok?)
		assert(last_response.body.include?('Wow Chloe, only 16! What are your 3 favorite numbers?'))
	end
end
