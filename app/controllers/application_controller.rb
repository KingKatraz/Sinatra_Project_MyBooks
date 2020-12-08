require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "d216b127704881978dba"
  end

  get "/" do
    erb :welcome
  end

  helpers do 

    def logged_in?
      !!session[:user_id]
    end

    def current_user_id
      session[:user_id]
    end

    def authentication
      redirect '/login' if !logged_in?
    end

    def authorize(resource)
      redirect back if resource.user.id != current_user_id
    end

  end


end
