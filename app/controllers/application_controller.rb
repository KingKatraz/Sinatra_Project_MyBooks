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
      session[:users_id]
    end 
  end


end