require 'sinatra'

class PersonalDetailsApp < Sinatra::Base

	get '/' do
		erb :name
	end

	post '/name' do
		name = params[:name_input]
		redirect '/age?name=' + name
	end

	get '/age' do
		name = params[:name]
		erb :age, locals: {name: name}
	end

	post '/age' do
		name = params[:name_input]
		age = params[:age_input]
		redirect '/fav_nums?age=' + age + '&name' + name
	end

	get '/fav_nums' do
		name = params[:name]
		age = params[:age]
	end

end