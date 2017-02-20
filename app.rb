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

end