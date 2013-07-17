require 'sinatra/reloader'
require './idea'

class IdeaBoxApp < Sinatra::Base
	set :method_override, true
		configure :development do
			register Sinatra::Reloader
		end

	#Your modular code goes here
	not_found do
		erb :error
	end

	post '/:id/like' do |id|
		idea = IdeaStore.find(id.to_i)
		idea.like!
		IdeaStore.update(id.to_i, idea.to_h)
	  "I like this idea!"
	end

	get '/' do
		erb :index, locals: {ideas: Idea.all}
	end

	post '/' do
		idea = Idea.new(params['idea_title'], params['idea_description'])
  	idea.save
  	redirect '/'
	end

	delete '/:index' do |index|
    Idea.delete(index.to_i)
    redirect '/'
  end
end
