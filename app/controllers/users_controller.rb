class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect '/tweets'
        end 
        erb :'/users/new'
      end
    
    post '/signup' do
        #binding.pry
        @user = User.new(params)

        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
            @user.save
            session[:id] = @user.id
            redirect '/tweets'
        else 
            redirect '/signup'
        end 
    end 
    
    get '/login' do 
    
    end 

end
