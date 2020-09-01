class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect to '/tweets'
        else
            erb :'/users/new' 
        end 
    end
    
    post '/signup' do
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
        if logged_in?
            redirect '/tweets'
        else 
            erb :'users/login'
        end 
    end 

    post '/login' do
        @user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:id] = user.id
            erb :'/tweets'
        else
            redirect '/signup'
        end 
    end

end
