class BookController < ApplicationController 
    


    post '/books' do #CREATE
        @book = Book.create(title: params[:title], author: params[:author], user_id: session[:user_id])
        redirect "/books/#{@book.id}"
    end 

    get '/books/new' do #NEW
        erb :'/books/new'
    end 

    get '/books/:id' do #SHOW
        @book = Book.find_by(id: params[:id])
        if @book
        erb :'books/show'
        else
        "Uh oh! This book does not exit."
        end
    end


    get '/books' do #INDEX
        @books = Book.all
        erb :'/books/index'
    end

    get '/books/:id/edit' do #EDIT 
        @book = Book.find(params[:id])
        erb :'/books/edit'
    end 

    patch '/books/:id' do #UPDATE
        @book = Book.find(params[:id])
        @book.update(title: params[:title], author: params[:author])
        redirect "/books/#{@book.id}"
    end 

    delete '/books/:id' do #DESTROY/
        @book = Book.find(params[:id])
        @book.destroy
        redirect '/books'
    end 


end 