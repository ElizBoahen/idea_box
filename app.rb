class IdeaBoxApp < Sinatra::Base
	configure :development do
		register Sinatra::Reloader
		require './idea'
	end

	#Your modular code goes here
	not_found do
		erb :error
	end

	get '/' do
		"<h1>Hello, World!</h1><blockquote>I guess I always felt even if the world came to an end, McDonald's would still be open. <cite>Susan Beth Pfeffer</cite></blockquote>"
	end

	post '/' do
		# 1. Create an idea based on the form parameters
		idea = Idea.new
	  # 2. Store it
	  idea.save
	  # 3. Send us back to the index page to see all ideas
	  "Creating an IDEA!"
	end
end