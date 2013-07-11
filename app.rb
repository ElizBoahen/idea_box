class IdeaBoxApp < Sinatra::Base
	configure :development do
		register Sinatra::Reloader
	end

	#Your modular code goes here
end
	not_found do
		erb :error
	end

	get '/' do
		"Hello, world"
	end
end