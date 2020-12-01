class SessionsController < ApplicationController

    get "/login" do
        erb :'sessions/login'
    end 
    
    get "/signup" do 
        if session[:user_id]
            "You're already logged in!"
        else
            erb :'sessions/signup'
        end
    end 

    post "/signup" do 
        @user = User.create(params[:user])
        session[:user_id] = @user_id
        redirect "/users/#{@user.id}" 
    end


    post "/login" do 
        @user = User.find_by(username: params[:username].strip)
        
        if @user.authenticate(params[:password])
            session[:user_id] = @user_id
            redirect "/users/#{@user.id}"
        else
            erb :'/sessions/login'
        end 
    end


    get "/logout" do 
        session.clear
        redirect "/"
    end 

end 