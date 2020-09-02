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
            session[:user_id] = @user.id
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

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/tweets'
        else
            redirect '/signup'
        end 
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/login'
        else 
            redirect '/'
        end 
    end

    get '/users/:id' do
        if logged_in?
            @user = current_user
            erb :'/users/show'
        else
            redirect '/login'
        end 
    end 

end
