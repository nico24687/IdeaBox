require 'bundler'
require 'sinatra'
require 'sinatra/reloader'
require './idea'
Bundler.require

# class IdeaBoxApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  not_found do
    erb :error
  end
  
  get '/' do
    erb :index, locals: {ideas: Idea.all}
  end
  
  post '/' do
    params.inspect
    #1. Create an idea based on the form parameter 
    idea = Idea.new(params['idea_title'],params['idea_description'])
    # #2. Store it 
    idea.save 
    # #3. send us back to the index page to see all ideas 
    redirect '/'
  end
  
# end



# < Sinatra::Base
#   run! if app_file == $0